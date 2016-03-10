import sublime
import sublime_plugin
import os.path

class ReplVirtualenvCommand(sublime_plugin.WindowCommand):
    """ SublimeREPL: Shell - virtualenv """

    def run(self):

        venv_activate_script = self.get_venv_activate_script()
        if not venv_activate_script:
            self.window.show_quick_panel([
                "프로젝트 설정에서 'venv_activate_script'를 지정해야 합니다."
            ], None)
            return

        self.window.run_command('repl_open', {
            "type": "subprocess",
            "encoding": "$win_cmd_encoding",
            "cmd": ["cmd.exe", "/k",
                    "prompt", "$P$_$G", "&&", venv_activate_script],
            "cwd": self.get_projdir(),
            "cmd_postfix": "\n",
            "suppress_echo": True,
            "external_id": "shell",
            "syntax": "Packages/Text/Plain text.tmLanguage"
        })

    def get_venv_activate_script(self):
        settings = self.window.active_view().settings()
        # Can be relative path from project root
        venv_actvsc = settings.get('venv_activate_script')
        return os.path.normpath(venv_actvsc) if venv_actvsc else None

    def get_projdir(self):
        proj = self.window.project_file_name()
        # Project directory or current file path
        return os.path.dirname(proj) if proj else '$file_path'
