export LANG=ko_KR.UTF-8

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
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/sublime", from:oh-my-zsh
zplug "b4b4r07/enhancd", of:enhancd.sh
zplug "supercrabtree/k"
zplug "jimeh/zsh-peco-history"
zplug "zsh-users/zsh-syntax-highlighting", nice:19

if ! zplug check; then; zplug install; fi
zplug load --verbose

# Set prompt.
# https://github.com/b4b4r07/zplug/issues/95
source "$ZPLUG_HOME/repos/robbyrussell/oh-my-zsh/themes/robbyrussell.zsh-theme"

# Set my aliases.
alias ll='ls -alFh'
