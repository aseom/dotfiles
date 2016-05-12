#!/usr/bin/env bash

INSTALL_PATH="$HOME"
DOTFILES_PATH="$(cd "$(dirname "$0")" && pwd)"

ask_for_confirmation() {
    read -n 1
    echo  # Add newline
    [[ "$REPLY" =~ ^[Yy] ]] && return 0 || return 1
}

create_symlink() {
    if [ -e "$2" ]; then
        echo ""$2" is already exists. overwrite it? [y/N]:"
        if ask_for_confirmation; then
            echo "Removing '$2'..."
            rm -rf "$2"
        else
            echo "Skipping '$2'..."
            return
        fi
    fi
    ln -sfv "$1" "$2"
}

main() {
    echo "Creating symlinks from '$DOTFILES_PATH' to '$INSTALL_PATH'..."

    # Symlink `~/.ssh/config`
    local ssh_dir="$INSTALL_PATH/.ssh"
    [ ! -d "$ssh_dir" ] && mkdir -v "$ssh_dir" && chmod 700 "$ssh_dir"
    create_symlink "$DOTFILES_PATH/.ssh_config" "$ssh_dir/config"

    # Synlink other files/dirs
    files=(
        .gitconfig .gitignore_global
        .zshrc .vimrc .tmux.conf .tern-config
        .zsh .vim bin
    )
    for file in ${files[@]}; do
        create_symlink "$DOTFILES_PATH/$file" "$INSTALL_PATH/$file"
    done
}

main
