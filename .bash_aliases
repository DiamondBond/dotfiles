alias cls='clear'
alias whereami='echo $PWD'
alias whatami='cat /etc/hostname'
alias temps='watch -n .1 sensors'
alias getip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias rip='grep --color=auto'
alias m='mousepad '
alias gstat='git status'
alias gpull='git pull'
alias gpush='git push origin master'
alias gb='git branch'
alias gadd='git add -A'
alias gcom='git commit'
#alias pkgcount='dpkg -l | grep -c ^i'
alias ytmp3='youtube-dl --extract-audio --audio-format mp3 '
alias tl='tmux list-session'
alias tk='tmux kill-session'
alias tn='tmux new'
alias ta='tmux attach'
alias weather='curl wttr.in/cmb?0'
alias weatherfull='curl wttr.in/cmb'
alias randvid='mpv --shuffle /run/media/diamond/Data/Videos/'
alias up='uptime -p'
alias soff='mpc single off'
alias music="ncmpcpp"
alias py='python3'
alias ff='firefox'
alias enlarge_tmp='sudo mount -o remount,size=16G /tmp/'
#alias update-grub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
alias topdf='wkhtmltopdf'
alias sxiv='sxiv -b'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias jctl="journalctl -p 3 -xb"
alias sysupgrade="sudo apt update; sudo apt upgrade -y"
alias p="python3"

#games
#alias nfsmw='cd ~/games/nfsmw; wine nfsmwres.exe'
#alias deusex='cd ~/games/Deus_Ex/System; wine DeusEx.exe'
#alias hl='cd ~/games/Half-Life/; wine hl.exe'
alias brutaldoom='flatpak run org.zdoom.GZDoom -file brutalv21.pk3'
#alias mc='java -jar ~/games/mc.jar'
alias mc='java -jar ~/bin/mc.jar'

# Emacs
#alias em="/usr/bin/emacs -nw"
#alias vim="emacsclient -t"
alias et="emacsclient -t"
alias em="emacsclient -c -a 'emacs'"
alias startemacs="emacs --daemon"
alias hardkillemacs="emacsclient -e '(kill-emacs)'"
alias killemacs="emacsclient -e '(save-buffers-kill-emacs)'"

alias botnet="google-chrome-stable"
