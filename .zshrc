export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=ko_KR.UTF-8

# zplug
if [ ! -f ~/.zplug/zplug ]; then
    curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug
fi
source ~/.zplug/zplug

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/sublime", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", of:zsh-syntax-highlighting.zsh, nice:19

if ! zplug check; then; zplug install; fi
zplug load

# https://github.com/b4b4r07/zplug/issues/95
source "$ZPLUG_HOME/repos/robbyrussell/oh-my-zsh/themes/robbyrussell.zsh-theme"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias ll='ls -alFh'
