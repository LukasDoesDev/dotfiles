#!/usr/bin/env bash
{ # This ensures the entire script is downloaded.

set -e
if [ ! -d ${HOME}/dev ]; then
  mkdir ${HOME}/dev/
fi
if [ ! -d ${HOME}/dev/rice ]; then
  mkdir ${HOME}/dev/rice
fi
basedir="${HOME}/dev/rice"
repourl="https://github.com/LukasDoesDev/dotfiles.git"

cd $basedir
git clone $repourl
${basedir}/dotfiles/bootstrap.sh --force

} # This ensures the entire script is downloaded.
