import os
from notebook.auth import passwd

c.NotebookApp.notebook_dir = '/opt/notebooks'
c.NotebookApp.ip = os.environ['JUPYTER_IP']
c.NotebookApp.password = passwd(os.environ['JUPYTER_PASSWORD'])
c.NotebookApp.password_required = True
# c.NotebookApp.token = u''
c.NotebookApp.open_browser = False
c.NotebookApp.quit_button = False
c.NotebookApp.port = int(os.environ['JUPYTER_PORT'])
