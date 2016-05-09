# Start tmux on login
#if [[ $- == *i* ]] && [ -z $TMUX ]; then
#    which tmux > /dev/null && exec tmux
#fi

# fzf
FZF_PATH="$HOME/.fzf"
if [ -d $FZF_PATH ]; then
    export PATH="$FZF_PATH/bin:$PATH"
    source $FZF_PATH/shell/completion.zsh
    source $FZF_PATH/shell/key-bindings.zsh
fi

# Exports
export LANG=en_US.UTF-8
export PATH="$HOME/bin:$PATH"

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

# Colorize!
alias ls='ls -G'
alias grep='grep --color=auto'

# Set my aliases.
alias ll='ls -alFh'
alias vimn='vim +NERDTree'

# git aliases
alias gss='git status'
alias gdf='git diff'
alias gaa='git add -A'
alias gcm='git commit'
alias gpcb='git push origin HEAD'
