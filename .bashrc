#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

# Original prompt
# PS1='[\u@\h \W]\$ '

# Set neovim stuff
NVIM_HOME=~/.nvim
export EDITOR='nvim'
export VISUAL='nvim'

# Set prompts
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export PS2='\[\033[01;34m\]> \[\033[00m\]'

# Source aliases
source ~/aliasrc.sh

# Add stuff to path
[ -d ~/bin ] && export PATH="$HOME/bin:$PATH"        # Add ~/bin to $PATH if it exists
[ -d ~/bin ] && export PATH="$HOME/scripts:$PATH"    # Add ~/scripts to $PATH if it exists
[ -d ~/bin ] && export PATH="$HOME/.local/bin:$PATH" # Add ~/.local/bin to $PATH if it exists

# Set ls colors
LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106'
export LS_COLORS

# Set manpage colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

