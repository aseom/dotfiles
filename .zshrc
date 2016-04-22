export LANG=en_US.UTF-8

# zplug
if [ ! -f ~/.zplug/zplug ]; then
    echo "Installig zplug..."
    curl -fsSLo ~/.zplug/zplug --create-dirs https://git.io/zplug
fi
source ~/.zplug/zplug

# commands
zplug "peco/peco", from:gh-r, as:command
zplug "junegunn/fzf-bin", file:"fzf", from:gh-r, as:command

# plugins
zplug "plugins/sublime", from:oh-my-zsh
zplug "b4b4r07/enhancd", of:enhancd.sh
zplug "zsh-users/zsh-syntax-highlighting", nice:18
zplug "zsh-users/zsh-history-substring-search", nice:19

if ! zplug check; then; zplug install; fi
zplug load --verbose

export PATH="${HOME}/bin:${PATH}"

# Set prompt.
# https://github.com/b4b4r07/zplug/issues/95
source "$ZPLUG_HOME/repos/robbyrussell/oh-my-zsh/themes/robbyrussell.zsh-theme"

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
