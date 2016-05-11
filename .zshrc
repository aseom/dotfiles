# Exports
export LANG=en_US.UTF-8
export PATH="$HOME/bin:$PATH"
export DOTFILES="$HOME/dotfiles"

# History
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

# Write history file as soon as command entered
setopt inc_append_history
setopt share_history

# Ignore repeated commands
setopt hist_ignore_dups

# Allow remap Ctrl+S, Ctrl+Q
stty -ixon -ixoff

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/plugins.zsh
