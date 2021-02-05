#!/usr/bin/env bash
{ # This ensures the entire script is downloaded.

mkdir $HOME/dev/
basedir="$HOME/dev"
repourl="https://github.com/LukasDoesDev/dotfiles.git"

cd $basedir
git clone $repourl && cd dotfiles && source bootstrap.sh

} # This ensures the entire script is downloaded.
