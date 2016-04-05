export LANG=ko_KR.UTF-8

# zplug
if [ ! -f ~/.zplug/zplug ]; then
    echo "Installig zplug..."
    curl -fsSLo ~/.zplug/zplug --create-dirs https://git.io/zplug
fi
source ~/.zplug/zplug

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/sublime", from:oh-my-zsh
zplug "supercrabtree/k", of:k.sh
zplug "peco/peco", from:gh-r, as:command
zplug "zsh-users/zsh-syntax-highlighting", of:zsh-syntax-highlighting.zsh, nice:18
zplug "zsh-users/zsh-history-substring-search", nice:19

if ! zplug check; then; zplug install; fi
zplug load --verbose

# https://github.com/b4b4r07/zplug/issues/95
source "$ZPLUG_HOME/repos/robbyrussell/oh-my-zsh/themes/robbyrussell.zsh-theme"

# Set my aliases.
alias ll='ls -alFh'
