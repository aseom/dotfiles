# https://atom.io/docs/api

path = require('path')
exec = require('child_process').exec
fs = require('fs')

open_term = (dir) -> exec "open -a iTerm '#{dir}'"

atom.commands.add 'atom-workspace',
  'custom:open-in-terminal': ->
    editor = atom.workspace.getActiveTextEditor()
    filepath = editor?.buffer.file?.path
    open_term path.dirname(filepath) if filepath?

  'custom:open-project-root-in-terminal': ->
    projpath = atom.project.getPaths()[0]
    open_term projpath if projpath?

  'custom:save-package-list': ->
    cmd = "#{atom.packages.getApmPath()} list --installed --bare"
    exec cmd, (error, stdout, stderr) ->
      throw error if error?
      atom.notifications.addInfo cmd
      fs.writeFileSync path.join(atom.configDirPath, 'packages.txt'), stdout
