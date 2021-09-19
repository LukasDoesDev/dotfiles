#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
    rsync --exclude ".git/" \
        --exclude "bootstrap.sh" \
        --exclude "setup.sh" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        -avh --no-perms . ~; # "-ahv" = archive verbose human-readable
    source ~/.bash_profile;
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    echo ""
    echo Synchronising home folder with dotfiles repo
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
