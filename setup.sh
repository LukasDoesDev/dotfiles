#!/usr/bin/env bash
{ # This ensures the entire script is downloaded.

set -e
if [ ! -d ${HOME}/dev ]; then
  mkdir ${HOME}/dev/
fi
basedir="${HOME}/dev"
repourl="https://github.com/LukasDoesDev/dotfiles.git"

cd $basedir
git clone $repourl
source ${basedir}/dotfiles/bootstrap.sh

} # This ensures the entire script is downloaded.
