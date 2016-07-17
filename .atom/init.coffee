# https://atom.io/docs/api

path = require('path')
exec = require('child_process').exec

open_term = (dir) -> exec "open -a iTerm '#{dir}'"

atom.commands.add 'atom-workspace',
  'custom:open-in-terminal': ->
    editor = atom.workspace.getActiveTextEditor()
    filepath = editor?.buffer.file?.path
    open_term path.dirname(filepath) if filepath?

  'custom:open-project-root-in-terminal': ->
    projpath = atom.project.getPaths()[0]
    open_term projpath if projpath?
