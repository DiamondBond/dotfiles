# ~/.bash_profile
[[ -s ~/.bashrc ]] && source ~/.bashrc

# Locacles
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Aliases
alias ls='ls -GFh'
alias ll='ls -l'
alias yt-dl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"
alias transfer=transfer
alias irctest=irctest

# Tmux session handling
alias t-create="tmux new -s local"
alias t-attach="tmux a #local"
alias t-kill="tmux kill-session -t local"

# Prompt
clear
export PS1=" ~ "
