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

def get_venv_activator(window):
    """
    프로젝트 설정의 'python_interpreter' 값을 이용
    인터프리터가 존재하는 디렉토리에서 'activate.bat'을 찾음
    
    """
    py_interp = window.active_view().settings().get('python_interpreter')
    if not py_interp:
        raise Exception("프로젝트 설정에서 'python_interpreter'를 지정해야 함")

    py_interp = py_interp.replace('$project_path', get_project_dir(window))
    script_path = os.path.normpath(os.path.dirname(py_interp)) + '\\activate.bat'
    if not os.path.exists(script_path):
        raise Exception("'%s'를 찾을 수 없음" % script_path)
        
    return script_path


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

        if shell == 'cmd_plus': self.open_cmd_plus(cwd)
        if shell == 'cmd_venv': self.open_cmd_venv(cwd)
        if shell == 'git_bash': self.open_git_bash(cwd)

    def open_cmd_plus(self, cwd):
        subprocess.Popen('cmd.exe /k C:\\Console\\profile.cmd "%s"' % cwd)

    def open_cmd_venv(self, cwd):
        try:
            script = get_venv_activator(self.window)
        except Exception as e:
            self.window.show_quick_panel([str(e)], None)
        else:
            subprocess.Popen([
                'cmd.exe', '/k', 'C:\\Console\\profile.cmd', cwd, '&&', script])

    def open_git_bash(self, cwd):
        subprocess.Popen('C:\\Git\\git-bash.exe --cd="%s"' % cwd)
