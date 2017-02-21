# auto reload python
# Doc: https://ipython.org/ipython-doc/3/config/extensions/autoreload.html
c = get_config()
c.InteractiveShellApp.exec_lines = []
c.InteractiveShellApp.exec_lines.append('%load_ext autoreload')
c.InteractiveShellApp.exec_lines.append('%autoreload')
