#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon # Disable Ctrl+S and Ctrl+Q
shopt -s autocd # Allows you to cd into directory merely by typing the directory name.
shopt -s globstar 2> /dev/null # Turn on ** globbing, enables you to recurse all directories like this: dir/**/insomesubdir.sh
shopt -s nocaseglob # Case-insensitive globbing e.g There is a directory named `Foobar` so `foo*` will glob it regardless of the casing of the directory

# Enable history expansion with space
# e.g typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Original prompt
# PS1='[\u@\h \W]\$ '

# Set neovim stuff
NVIM_HOME=~/.nvim

DEBUG="${DEBUG:-false}"

# Set enviroment variables
export EDITOR='nvim'
export FCEDIT="$EDITOR"
export HISTFILE="/tmp/.bash-history-$USER"
export HISTSIZE=1000000
export HISTFILESIZE=1000000000
export LESS='--quit-if-one-screen --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
export VISUAL='nvim'
export TERMINAL='urxvt'
export BROWSER='firefox'
JAVA_HOME='/usr/lib/jvm/java-16-adoptopenjdk'
[ -d $JAVA_HOME ] && export JAVA_HOME
ANDROID_SDK_ROOT='/opt/android-sdk'
[ -d $ANDROID_SDK_ROOT ] && export ANDROID_SDK_ROOT

# Set prompts
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export PS2='\[\033[01;34m\]> \[\033[00m\]'

$DEBUG && echo 'Settign up aliases'
source ~/.aliases

# Add stuff to path
[ -d ~/bin ] && export PATH="$HOME/bin:$PATH"        # Add ~/bin to $PATH if it exists
[ -d ~/scripts ] && export PATH="$HOME/scripts:$PATH"    # Add ~/scripts to $PATH if it exists
[ -d ~/.local/bin ] && export PATH="$HOME/.local/bin:$PATH" # Add ~/.local/bin to $PATH if it exists
[ -d ~/.cargo/bin ] && export PATH="$HOME/.local/bin:$PATH" # Add ~/.cargo/bin to $PATH if it exists
[ -d $ANDROID_SDK_ROOT/emulator ] && export PATH="$ANDROID_SDK_ROOT/emulator:$PATH" # Add $ANDROID_SDK_ROOT/emulator to $PATH if it exists
[ -d ~/.deno/bin ] && export PATH="$HOME/.deno/bin:$PATH"
[ -d ~/.cargo/bin ] && export PATH="$HOME/.cargo/bin:$PATH"

# Set ls colors
LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106'
export LS_COLORS

$DEBUG && echo 'Setting up Node Version Manager'
[ -s /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

$DEBUG && echo 'Setting up https://velociraptor.run bash completions'
#command -v vr &> /dev/null && source <(vr completions bash)

# Set manpage colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESSOPEN="|lesspipe.sh %s"

# Java
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# Make many programs' history files not use the root dir
#export PYTHONHISTFILE="/tmp/.python_history-$USER" # Does not work
export NODE_REPL_HISTORY="/tmp/.node_repl_history-$USER" # Confirmed works
export REDISCLI_HISTFILE="/tmp/.rediscli_history-$USER"
export USQL_HISTORY="/tmp/.usql_history-$USER"
export SDCV_HISTFILE="/tmp/.sdcv_history-$USER"
export SQLITE_HISTORY="/tmp/.sqlite_history-$USER"

$DEBUG && echo 'Setting up Keychain'
command -v keychain && keychain --eval --agents ssh id_ed25519

# Start default WM after start (no $DISPLAY and tty is tty1 and not root user)
if [[ -z "${DISPLAY}" && "$(tty)" == '/dev/tty1' && "$USER" != 'root' ]]; then
	exec startx
fi
