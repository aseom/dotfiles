# Exports
export LANG=en_US.UTF-8
export PATH="$HOME/bin:$PATH"
export DOTFILES="$HOME/dotfiles"

# Enable completion
autoload -U compinit && compinit

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

# fzf
FZF_PATH="$HOME/.fzf"
if [ -d $FZF_PATH ]; then
    export PATH="$FZF_PATH/bin:$PATH"
    source $FZF_PATH/shell/completion.zsh
    source $FZF_PATH/shell/key-bindings.zsh
fi

# Must be at the end
load_plugin "$DOTFILES/vender/zsh-syntax-highlighting"
