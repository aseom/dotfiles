import sublime
import sublime_plugin
import os.path
import subprocess
import webbrowser

class ItermHereCommand(sublime_plugin.WindowCommand):
    def run(self, paths = []):
        if paths:
            # Paths would be passed if it called from side bar
            path = paths[0]
            cwd = path if os.path.isdir(path) else os.path.dirname(path)
        else:
            # Alternatively, use project root
            project_file = self.window.project_file_name()
            cwd = os.path.dirname(project_file) if project_file else '$HOME'

        subprocess.Popen('open -a iTerm "%s"' % cwd, shell=True)

class WebSearchCommand(sublime_plugin.TextCommand):
    def run(self, edit, base_url, suffix):
        sel_texts = []
        for region in self.view.sel():
            sel_texts.append(self.view.substr(region))
            
        # Join multiselected texts with space
        query = " ".join(sel_texts)

        # Ommit suffix in URL if here is no query 
        full_url = base_url + suffix + query if query else base_url

        webbrowser.open(full_url)
