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
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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
		e ~/.config/nvim/init.vim
	elif [[ "$1" = 'aliases' ]]; then
		e ~/aliasrc.sh
		source ~/aliasrc.sh
	elif [[ "$1" = 'bashrc' ]]; then
		e ~/.bashrc
		source ~/.bashrc
	elif [[ "$1" = 'bash_profile' ]]; then
		e ~/.bash_profile
		source ~/.bash_profile
	else
		echo Lukas\'s configuration utility
		if [[ "$1" != '' ]]; then sh -c "echo \"$1\" config not found"; fi
		echo Configs:
		echo nvim
		echo aliases
		echo bashrc
		echo bash_profile
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
