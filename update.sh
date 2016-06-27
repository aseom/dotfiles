#!/usr/bin/env bash
set -o errexit

cd "$(dirname "$0")"
git submodule foreach git pull

# Update fzf binary
. vender/fzf/install --bin
