# Set basic environment variables
export NVIM_HOME='~/.nvim'
export EDITOR='nvim'
export FCEDIT="$EDITOR"
export HISTFILE="/tmp/.zsh-history-$USER"
export HISTSIZE=1000000
export HISTFILESIZE=1000000000
export LESS='--quit-if-one-screen --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
export TERMINAL='alacritty'
export BROWSER='firefox'
JAVA_HOME='/usr/lib/jvm/java-16-adoptopenjdk'
[ -d $JAVA_HOME ] && export JAVA_HOME
ANDROID_SDK_ROOT='/opt/android-sdk'
[ -d $ANDROID_SDK_ROOT ] && export ANDROID_SDK_ROOT


# Set ls colors
LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106'
export LS_COLORS


# Add directories to the PATH
typeset -U PATH path
path=(
    "$HOME/.local/bin"
    "$HOME/bin"
    "$HOME/scripts"
    "$HOME/scripts/polybar-scripts"
    "$HOME/scripts/leftwm-scripts"
    "$HOME/.cargo/bin"
    "$ANDROID_SDK_ROOT/emulator"
    "$HOME/.deno/bin"
    "$path[@]"
)
export PATH

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

# Make many programs' history files not use the home dir
#export PYTHONHISTFILE="/tmp/.python_history-$USER" # Does not work
export NODE_REPL_HISTORY="/tmp/.node_repl_history-$USER" # Confirmed works
export REDISCLI_HISTFILE="/tmp/.rediscli_history-$USER"
export USQL_HISTORY="/tmp/.usql_history-$USER"
export SDCV_HISTFILE="/tmp/.sdcv_history-$USER"
export SQLITE_HISTORY="/tmp/.sqlite_history-$USER"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Manpage path
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

