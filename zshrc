##### .zshrc / Diamond ###########################

##### OHMYZSH #####################################

# PATH
export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="terminalpartied"
#ZSH_THEME="avit"
#ZSH_THEME="lambda"
ZSH_THEME="minimal"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_MODE='nerdfont-complete'

##### MISC ########################################

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

##### PLUGINS #####################################

plugins=(zsh-syntax-highlighting zsh-autosuggestions colorize cp git dnf colored-man-pages emoji-clock rand-quote)

##### BINDS #######################################

# CLIMB BIND
bindkey -s "^k" '^Ucd ..^M'
# DIR BIND
bindkey -s "^l" '^Ule^M'

##### ALIASES #####################################

# SPACED DIR
alias le="echo ''; ls; echo ''"
# RELOAD XRESOURCES
alias xr="xrdb -merge ~/.Xresources"
# TIME
alias now="echo -e $(date +'%I:%M')"
# YOUTUBE-DL
alias yt-dl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"

##### PATH ######################################## 

# BIN
export PATH=$HOME/.bin/:$PATH
# PYTHON
#export PATH=/usr/local/anaconda/bin/:$PATH
# JAVA
#export PATH=/usr/lib/jvm/java-10-jdk/bin/:$PATH
# ZSH
source $ZSH/oh-my-zsh.sh

##### OTHER #######################################

if [[ "$TERM" == "dumb" ]]
then
	unsetopt zle
	unsetopt prompt_cr
	unsetopt prompt_subst
	unfunction precmd
	unfunction preexec
	PS1='$ '
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
fi
