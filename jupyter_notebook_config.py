# Set options for certfile, ip, password, and toggle off
# browser auto-opening
# c.NotebookApp.certfile = u'/absolute/path/to/your/certificate/mycert.pem'
# c.NotebookApp.keyfile = u'/absolute/path/to/your/certificate/mykey.key'
# Set ip to '*' to bind on all interfaces (ips) for the public server
c.NotebookApp.ip = '*'
c.NotebookApp.password = u'sha1:10c726fe6773:40e8096a9e0d41c4a51c024a53f341fc5b87270c'
c.NotebookApp.password_required = True
# c.NotebookApp.token = u''
c.NotebookApp.open_browser = False
c.NotebookApp.quit_button = False

# It is a good idea to set a known, fixed port for server access
c.NotebookApp.port = 8080