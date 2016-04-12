import sublime
import sublime_plugin
import os.path
import subprocess

def ensure_isdir(path):
    return path if os.path.isdir(path) else os.path.dirname(path)

def get_project_dir(window):
    proj_file = window.project_file_name()
    if not proj_file:
        raise Exception("현재 프로젝트 디렉토리를 알 수 없음")
    return os.path.dirname(proj_file)


class ConsoleHereCommand(sublime_plugin.WindowCommand):
    def run(self, shell, paths = []):
        if paths:
            # Sidebar에서 호출되었다면 paths가 존재
            selected_dir = paths[0]
            cwd = ensure_isdir(selected_dir)
        else:
            # 아니면, 프로젝트 디렉토리 사용
            try:
                cwd = get_project_dir(self.window)
            except Exception as e:
                self.window.show_quick_panel([str(e)], None)
                return

        if shell == 'iterm':
            subprocess.Popen('open -a iTerm "%s"' % cwd, shell=True)
