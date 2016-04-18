export LANG=en_US.UTF-8

# zplug
if [ ! -f ~/.zplug/zplug ]; then
    echo "Installig zplug..."
    curl -fsSLo ~/.zplug/zplug --create-dirs https://git.io/zplug
fi
source ~/.zplug/zplug

# vim-plug
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Installig vim-plug..."
    curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# commands
zplug "peco/peco", from:gh-r, as:command
zplug "junegunn/fzf-bin", file:"fzf", from:gh-r, as:command

# plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
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

# http://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s
stty -ixon

# Set my aliases.
alias ll='ls -alFh'
