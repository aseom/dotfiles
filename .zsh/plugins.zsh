load_plugin "$DOTFILES/vender/zsh-completions"
load_plugin "$DOTFILES/vender/zsh-async"
load_plugin "$DOTFILES/vender/pure"

load_plugin "$DOTFILES/vender/zsh-autosuggestions"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=251"

# FZF
fzf="$DOTFILES/vender/fzf"
if [ ! -e "$fzf/bin/fzf" ]; then
    echo "Installing fzf binary..."
    $fzf/install --bin
fi
export PATH="$PATH:$fzf/bin"
load_plugin "$fzf/shell"  # Load `*.zsh`

export FZF_DEFAULT_OPTS="--color=light,bg+:254"
export FZF_COMPLETION_TRIGGER="\`"  # cd `<TAB>


# Enable completion
autoload -U compinit && compinit

# Load after compinit
load_plugin "$DOTFILES/vender/zsh-syntax-highlighting"
