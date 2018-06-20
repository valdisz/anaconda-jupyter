FROM frolvlad/alpine-miniconda3:latest

RUN apk update && \
    apk --no-cache add shadow bash

RUN groupadd -g 900 anaconda && \
    useradd -r -u 900 -g anaconda -m anaconda

RUN mkdir /opt/notebooks && \
    chown anaconda:anaconda /opt/notebooks && \
    chmod go=rwx /opt/notebooks
RUN conda install jupyter -y && \
    conda install -c conda-forge jupyter_contrib_nbextensions -y

ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini

USER anaconda
EXPOSE 8080

# !!! do not forget to change password
ENV JUPYTER_PASSWORD=password
ENV JUPYTER_IP=*
ENV JUPYTER_PORT=8888

COPY ./jupyter_notebook_config.py /home/anaconda/.jupyter/

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD [ "jupyter", "notebook" ]
