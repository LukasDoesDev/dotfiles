#!/usr/bin/env bash
{ # This ensures the entire script is downloaded.

set -e

mkdir ${HOME}/dev/
basedir="${HOME}/dev"
repourl="https://github.com/LukasDoesDev/dotfiles.git"

cd $basedir
git clone $repourl
source ${HOME}/dotfiles/bootstrap.sh

} # This ensures the entire script is downloaded.
