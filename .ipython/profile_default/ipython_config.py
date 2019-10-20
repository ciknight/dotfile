# sample ipython_config.py
# Doc: https://ipython.readthedocs.io/en/stable/config/extensions/autoreload.html

c = get_config()  # mypy: ignore
c.InteractiveShellApp.exec_lines = []
c.InteractiveShellApp.exec_lines.append('%load_ext autoreload')
c.InteractiveShellApp.exec_lines.append('%autoreload 2')

# Configuration file for ipython.abs
# Generated a default configuration filw with $(ipython3 profile create)
c.TerminalInteractiveShell.editing_mode = 'vi'  # Set vi editing mode.abs
c.TerminalIPythonApp.display_banner = False  # Hide start up text.
c.InteractiveShell.confirm_exit = False  # Don't confirm exits.
