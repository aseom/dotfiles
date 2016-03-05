import sublime
import sublime_plugin
import webbrowser

class WebSearchCommand(sublime_plugin.TextCommand):
	def run(self, edit, base_url, suffix):

		sel_texts = []
		for region in self.view.sel():
			sel_texts.append(self.view.substr(region))

		# Join multiselected text, with space
		query = " ".join(sel_texts)

		# 선택된 텍스트가 없다면 메인 URL로
		full_url = base_url + suffix + query if query else base_url
		webbrowser.open(full_url)
