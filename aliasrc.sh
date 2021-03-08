#!/bin/sh

# Use neovim for vim when possible.
command -v nvim >/dev/null && alias vim='nvim' vimdiff='nvim -d'

# Easier navigation:
alias cd..='cd ..'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'

# Shortcuts, verbosity
alias mkd='mkdir -pv' # Create parent dirs on demand
alias e='$EDITOR' # Alias e to the editor
alias cls='clear && ls' # Clear and list files
alias diff='icdiff'
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort" # View mounted devices
alias gh='history | grep'
alias c='clear'
alias sha1='openssl sha1'
alias h='history'
alias j='jobs -l'
alias ff='firefox'

# Consoom
alias yt='youtube-viewer'
alias yt-dl='youtube-dl --add-metadata -i'
alias yt-dl-audio='yt-dl -f "bestaudio[ext=m4a]"'

# Confirmation
alias cp='cp -i' # Add confirmation
alias mv='mv -i' # Add confirmation
alias rm='rm -i' # Add confirmation
alias ln='ln -i' # Add confirmation

# Verbose output
alias cp='cp -v' # Add verbose output
alias mv='mv -v' # Add verbose output
alias rm='rm -v' # Add verbose output
alias ln='ln -v' # Add verbose output
alias cat='cat -n' # Add line numbering

# Preserve root
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias rm='rm --preserve-root'

# Pacman
alias paci='sudo pacman -S' # Pac-install
alias pacr='sudo pacman -R' # Pac-remove
alias pacu='sudo pacman -Syu' # Pac-update
alias autoremove='sudo pacman -Qtdq | sudo pacman -Rns -'

# Networking
alias fastping='ping -c 20 -i 0.2'
alias header='curl -I'
alias ports='netstat -tulanp'

# Color stuffs
alias grep='grep --color=auto'
alias grep='grep --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ccat='highlight --out-format=ansi -n'

# Get week number
alias week='date +%V'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# LS stuff
alias ls='ls -hF --group-directories-first --color=auto'
alias l='ls'
alias la='ls -a'
alias lal='ls -al'
alias ll='ls -l'
alias left='ls -t -1' # Where you left off
alias du='du -h'
alias t='tree'
alias getsizes='sudo du -shc .[!.]* * | sort -rh'

# Python shortcuts
alias ve='virtualenv venv'
alias va='source ./venv/bin/activate'

# Git shortcuts
alias ginit='git init'
alias gadd='git add'
alias gco='git commit'
alias gcom='git commit -m'
alias gpush='git push'
alias gpul='git pull'
alias gbranch='git branch'
alias gradd='git remote add'
alias gs='git status'
function gsd( )
{
  git --git-dir=$1/.git --work-tree=$1 status
}

function stringContain( )
{
  # echo first arg  : $1
  # echo second arg : $2
  [ -z "${2##*$1*}" ];
}

function gsda( )
{
  for file in ./* ; do
    if [[ -d "$file" && ! -L "$file" && -d "$file/.git" && ! -L "$file/.git" ]]; then

      git_status=`gsd $file`
      substr1="working tree clean"
      substr2="not a git repository"

      if stringContain "$substr1" "$git_status"; then
        echo "$file skipped (working tree clean)"
        continue
      fi

      if stringContain "$substr2" "$git_status"; then
        echo "$file skipped (not a git repo)"
        continue
      fi


      echo
      echo GIT STATUS:
      gsd $file
      echo
    else
      echo "$file skipped (not a dir or does not have .git subdirectory)"
    fi;
  done
}

function conf( )
{
	if [[ "$1" = 'nvim' ]]; then
		e ~/dev/dotfiles/.config/nvim/init.vim
	elif [[ "$1" = 'aliases' ]]; then
		e ~/dev/dotfiles/aliasrc.sh
		source ~/dev/dotfiles/aliasrc.sh
	elif [[ "$1" = 'bashrc' ]]; then
		e ~/dev/dotfiles/.bashrc
		source ~/dev/dotfiles/.bashrc
	elif [[ "$1" = 'bash_profile' ]]; then
		e ~/dev/dotfiles/.bash_profile
		source ~/dev/dotfiles/.bash_profile
	elif [[ "$1" = 'status' ]]; then
		e ~/dev/dotfiles/.dwm/status.sh
	elif [[ "$1" = 'sync' ]]; then
    ~/dev/dotfiles/bootstrap.sh
	else
		echo Lukas\'s configuration utility
		if [[ "$1" != '' ]]; then sh -c "echo \"$1\" config not found"; fi
		echo Configs:
		echo nvim
		echo aliases
		echo bashrc
		echo bash_profile
    echo status
    echo sync
	fi
}

function colorgrid( )
{
    iter=16
    while [ $iter -lt 52 ]
    do
        second=$[$iter+36]
        third=$[$second+36]
        four=$[$third+36]
        five=$[$four+36]
        six=$[$five+36]
        seven=$[$six+36]
        if [ $seven -gt 250 ];then seven=$[$seven-251]; fi

        echo -en "\033[38;5;$(echo $iter)m█ "
        printf "%03d" $iter
        echo -en "   \033[38;5;$(echo $second)m█ "
        printf "%03d" $second
        echo -en "   \033[38;5;$(echo $third)m█ "
        printf "%03d" $third
        echo -en "   \033[38;5;$(echo $four)m█ "
        printf "%03d" $four
        echo -en "   \033[38;5;$(echo $five)m█ "
        printf "%03d" $five
        echo -en "   \033[38;5;$(echo $six)m█ "
        printf "%03d" $six
        echo -en "   \033[38;5;$(echo $seven)m█ "
        printf "%03d" $seven

        iter=$[$iter+1]
        printf '\r\n'
    done
}
