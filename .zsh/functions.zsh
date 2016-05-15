load_plugin() {
    local location="$1"
    local ext
    local scripts_array
    local script

    # Try to find all `*.plugin.zsh` files.
    # If not exists, find `*.zsh`, find `*.sh`...
    for ext in plugin.zsh zsh sh; do
        scripts_array=( $location/*.$ext(N) )
        # If any script(s) found, break now.
        if [ $#scripts_array -gt 0 ]; then break; fi
    done

    # Source script(s) and add fpath.
    for script in $scripts_array; do
        #echo "> $script"
        source "$script"
    done
    fpath=("$location" $fpath)
}

tm() {
    # Tmux attach or create new session
    if tmux ls &>/dev/null; then
        echo "Tmux session is already exists. Use it? [y/N]:"
        read -q && echo && tmux attach && return
    fi
    tmux new
}

asdf() {
    [[ $1 == "-a" ]] && git add -A
    git commit && git push origin HEAD
}
