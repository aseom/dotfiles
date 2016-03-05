import sublime
import sublime_plugin
import os
import subprocess

def current_dir(window):
	active_file = window.active_view().file_name()
	active_folders = window.folders()
	if active_file:
		return active_file
	elif active_folders:
		return active_folders[0]
	else:
		return os.environ['USERPROFILE']

class CmdplusHereCommand(sublime_plugin.WindowCommand):
	def run(self, paths=[]):
		path = paths[0] if paths else current_dir(sublime.active_window())
		if not os.path.isdir(path): 
			path = os.path.dirname(path)
		subprocess.Popen('cmd.exe /k C:\\Console\\profile.cmd "%s"' % path)

class GitbashHereCommand(sublime_plugin.WindowCommand):
	def run(self, paths=[]):
		path = paths[0] if paths else current_dir(sublime.active_window())
		if not os.path.isdir(path): 
			path = os.path.dirname(path)
		subprocess.Popen('C:\\Git\\git-bash.exe --cd="%s"' % path)
