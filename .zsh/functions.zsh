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
    for script ($scripts_array) { source "$script" }
    fpath=("$location" $fpath)
}
