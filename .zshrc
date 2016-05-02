# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

ZSH_CUSTOM="$HOME/.zsh"
plugins=(zsh-syntax-highlighting)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

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

# Allow remap Ctrl+S, Ctrl+Q
stty -ixon -ixoff

# Set my aliases.
alias ll='ls -alFh'
alias vimn='vim +NERDTree'

# git aliases
alias gss='git status'
alias gdf='git diff'
alias gaa='git add -A'
alias gcm='git commit'
alias gpcb='git push origin HEAD'
