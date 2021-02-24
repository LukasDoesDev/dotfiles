#!/bin/sh

# Use neovim for vim when possible.
command -v nvim >/dev/null && alias vim='nvim' vimdiff='nvim -d'

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though

# Shortcuts, verbosity
alias ls='ls -hF --group-directories-first --color=auto'
alias cat='cat -n'
alias mkd='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias e='$EDITOR'
alias v='$EDITOR'
alias cls='clear && ls'
alias yt='youtube-viewer'
alias yt-dl='youtube-dl --add-metadata -i'
alias paci='sudo pacman -S'
alias pacr='sudo pacman -R'
alias diff='icdiff'
alias c='xclip'
alias p='xclip -o'
alias autoremove='sudo pacman -Qtdq | sudo pacman -Rns -'
alias yt-dl-audio='yt-dl -f "bestaudio[ext=m4a]"'

# Git shortcuts
alias ginit='git init'
alias gadd='git add'
alias gco='git commit'
alias gcom='git commit -m'
alias gpush='git push'
alias gpul='git pull'
alias gbranch='git branch'
alias gradd='git remote add'
alias gstat='git status'
function gsd( )
{
  git --git-dir=$1/.git --work-tree=$1 status
}

function stringContain ( )
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

# Color stuffs
alias grep='grep --color=auto'
alias grep='grep --color=auto'
alias ccat='highlight --out-format=ansi -n'

# Get week number
alias week='date +%V'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "${method}"="lwp-request -m '${method}'"
done

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
