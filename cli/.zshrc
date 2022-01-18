# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Path to your oh-my-zsh installation.
export ZSH="/home/luukas/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="spaceship"
#ZSH_THEME="robbyrussell"
eval "$(starship init zsh)"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    docker
    rust
    zsh-autosuggestions
    #zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

stty -ixon # Disable Ctrl+S and Ctrl+Q

setopt autocd nocaseglob extendedglob notify
unsetopt beep
bindkey -e

# Enable history expansion with space
# e.g typing !!<space> will replace the !! with your last command
bindkey " " magic-space

DEBUG="${DEBUG:-false}"

$DEBUG && echo 'Setting up Node Version Manager'
[ -s /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

$DEBUG && echo 'Setting up https://velociraptor.run bash completions'
#command -v vr &> /dev/null && source <(vr completions bash)

$DEBUG && echo 'Setting up Keychain'
command -v keychain && keychain --eval --agents ssh id_ed25519

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

# vim(1) to nvim(1)
command -v nvim &> /dev/null && alias vim='nvim' vimdiff='nvim -d'

# sudo(8) to doas(1)
command -v doas &> /dev/null && alias sudo='doas'

# node version manager
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

# Easier navigation:
alias cd..='cd ..'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'

# Shortcuts
alias r='fc -s' # Fixes your last command with a substitution e.g r fle=file
#alias bat='bat --theme TwoDark'
alias bat='bat --theme Nord'
alias bats='bat -pp'
alias sdn='sudo shutdown now'
alias p='sudo pacman'
alias ka='killall'
alias SS='sudo systemctl'
alias mkd='mkdir -pv' # Create parent dirs on demand
alias e='$EDITOR' # Alias e to the editor
alias nf='neofetch'
#alias diff='icdiff'
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort" # View mounted devices
alias gh='history | grep'
alias c='clear'
alias sha1='openssl sha1'
alias h='history'
alias j='jobs -l'
alias sxiv='sxiv -a'
alias countdown='time=5; while (( $time > 0 )); do printf "$time\r"; time="$(expr "$time" - 1)"; sleep 1; done'
alias o='xdg-open'
alias clip='xclip -sel clip'

# Consoom
command -v youtube-viewer &> /dev/null && alias ytv='youtube-viewer'
command -v youtube-dl &> /dev/null && alias yt='youtube-dl --add-metadata -ic'
command -v youtube-dl &> /dev/null && alias yta='youtube-dl --add-metadata -xic'

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
alias mkdir='mkdir -v' # Add verbose output

# Preserve root
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias rm='rm --preserve-root'

# Pacman
alias paci='sudo pacman -S' # Pac-install
alias pacr='sudo pacman -R' # Pac-remove
alias pacu='sudo pacman -Syu' # Pac-update
#alias autoremove='sudo pacman -Qtdq | sudo pacman -Rns -'
alias autoremove='yay -Yc'

# Networking
alias fastping='ping -c 20 -i 0.2'
alias header='curl -I'
alias ports='netstat -tulanp'

# Color stuffs
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ccat='highlight --out-format=ansi -n'

# Get week number
alias week='date +%V'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# LS stuff
if command -v exa &> /dev/null
then
    alias ls='exa -hF --group-directories-first --color=auto'
else
    alias ls='ls -hF --group-directories-first --color=auto'
fi
alias l='ls'
alias la='ls -a'
alias lal='ls -al'
alias ll='ls -l'
alias left='ls -t -1' # Where you left off
alias lsless='ls -al --color=always | less -r'
alias du='du -h'
alias t='tree'
alias getsizes='sudo du -shc .[!.]* * | sort -rh'

# Python shortcuts
alias ve='virtualenv venv'
alias va='source ./venv/bin/activate'

# Git shortcuts
alias g='git'
alias gadd='git add'
alias gcm='git commit -m'
alias gradd='got remote add'
alias gs='git status'
alias gb='git branch -vvv'
alias gdown='git pull'
alias gup='git push'
alias gf='git fetch'
alias gl='git log'
alias glp='git log --oneline --graph --all --decorate'

# Config aliases
function confls() {
    echo 'cbr : $EDITOR ~/.bashrc && source ~/.bashrc'
    echo 'cbp : $EDITOR ~/.bash_profile && source ~/.bash_profile'
    echo 'czr : $EDITOR ~/.zshrc && source ~/.zshrc'
    echo 'czp : $EDITOR ~/.zprofile && source ~/.zprofile'
    echo 'cze : $EDITOR ~/.zshenv && source ~/.zshenv'
}
alias cbr='$EDITOR ~/.bashrc && source ~/.bashrc'
alias cbp='$EDITOR ~/.bash_profile && source ~/.bash_profile'
alias czr='$EDITOR ~/.zshrc && source ~/.zshrc'
alias czp='$EDITOR ~/.zprofile && source ~/.zprofile'
alias cze='$EDITOR ~/.zshenv && source ~/.zshenv'

# Xephyr stuff
function xephyr-starter() {
    Xephyr -br -ac -noreset -screen 800x600 $1 &
}

# Scrot + Slop :P
function slrop() {
    scrot -a $(slop -D -f '%x,%y,%w,%h') $@
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
