import sublime
import sublime_plugin
import os.path
import subprocess
import webbrowser

class ItermHereCommand(sublime_plugin.WindowCommand):
    def run(self, paths = []):
        if paths:
            # Sidebar에서 호출되었다면 paths가 존재
            path = paths[0]
            cwd = path if os.path.isdir(path) else os.path.dirname(path)
        else:
            # 아니면, 프로젝트 디렉토리 사용
            project_file = self.window.project_file_name()
            cwd = os.path.dirname(project_file) if project_file else '$HOME'

        subprocess.Popen('open -a iTerm "%s"' % cwd, shell=True)

class WebSearchCommand(sublime_plugin.TextCommand):
    def run(self, edit, base_url, suffix):
        sel_texts = []
        for region in self.view.sel():
            sel_texts.append(self.view.substr(region))
            
        # Join multiselected text, with space
        query = " ".join(sel_texts)

        # 선택된 텍스트가 없다면 base url만 사용
        full_url = base_url + suffix + query if query else base_url

        webbrowser.open(full_url)
