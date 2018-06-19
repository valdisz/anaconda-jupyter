FROM frolvlad/alpine-miniconda3:latest

RUN groupadd -g 999 anaconda && \
    useradd -r -u 999 -g anaconda -m anaconda

RUN mkdir /opt/notebooks && \
    chown anaconda:anaconda /opt/notebooks && \
    chmod go=rwx /opt/notebooks
RUN conda install jupyter -y --quiet

ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini

USER anaconda
EXPOSE 8080

COPY ./jupyter_notebook_config.py /home/anaconda/.jupyter/

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD [ "jupyter", "notebook", "--notebook-dir=/opt/notebooks" ]