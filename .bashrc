# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias grep='grep --color=auto'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# autocd
shopt -s autocd

# set PATH so it includes user's private bin
PATH="$HOME/bin:$PATH"

# git config --global core.editor "vim"
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR="$VISUAL"

#export PS1="\u@\h \w \[$(tput sgr0)\]"
export PS1='\[\e]0;\w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[00m\] \w '

