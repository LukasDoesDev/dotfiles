#!/usr/bin/env bash
{ # This ensures the entire script is downloaded.

    set -e
    trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
    trap 'echo "\"${last_command}\" command failed with exit code $?."' EXIT

    mkdir -pv $HOME/dev/rice
    cd $HOME/dev/rice

    git clone https://github.com/LukasDoesDev/dotfiles.git

} # This ensures the entire script is downloaded.
