alias cls='clear'
alias la='ls -la'
alias l='ls'
alias whereami='echo $PWD'
alias whatami='cat /etc/hostname'
alias naptime='sudo systemctl suspend'
alias hwmon='watch -n .1 sensors'
alias getip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias rip='grep --color=auto'
alias e='$EDITOR '
alias m='mousepad '
alias c='cat '
alias gstat='git status'
alias gpull='git pull'
alias gpush='git push origin master'
alias gb='git branch'
alias gadd='git add -A'
alias gcom='git commit'
alias pkgcount='dpkg -l | grep -c ^i'
alias ytmp3='youtube-dl --extract-audio --audio-format mp3 '
alias tn='tmux new'
alias ta='tmux attach'
alias tk='tmux kill-session'
alias bg_a='hsetroot -solid "#AAAAAA"'
alias bg_g='hsetroot -solid "#EBECE7"'
alias bg_b='hsetroot -solid "#C0B5F9"'
alias weather='curl wttr.in/cmb?0'
alias weatherfull='curl wttr.in/cmb'
alias f='fzf'
alias irc='weechat'
alias bitchX='weechat'
alias redditfetch='neofetch'
alias randvid='mpv --shuffle ~/Videos/'
alias doom='gzdoom /home/diamond/.config/gzdoom/brutalv21.pk3'
alias starwars='telnet towel.blinkenlights.nl'
alias terraria='"/home/diamond/games/terraria/start.sh" ""'
alias up='uptime -p'
alias soff='mpc single off'
alias doas="sudo"
alias pkg="apt"
alias music="ncmpcpp"
