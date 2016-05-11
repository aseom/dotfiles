# fzf
FZF_PATH="$HOME/.fzf"
if [ -d $FZF_PATH ]; then
    export PATH="$FZF_PATH/bin:$PATH"
    source $FZF_PATH/shell/completion.zsh
    source $FZF_PATH/shell/key-bindings.zsh

    export FZF_DEFAULT_OPTS="--color=light,bg+:254"
    export FZF_COMPLETION_TRIGGER="\`"  # cd `<TAB>
fi

load_plugin "$DOTFILES/vender/zsh-completions"
load_plugin "$DOTFILES/vender/zsh-async"
load_plugin "$DOTFILES/vender/pure"

load_plugin "$DOTFILES/vender/zsh-autosuggestions"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=251"

# Enable completion
autoload -U compinit && compinit

# Load after compinit
load_plugin "$DOTFILES/vender/zsh-syntax-highlighting"
