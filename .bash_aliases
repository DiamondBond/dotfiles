alias cls='clear'
alias whereami='echo $PWD'
alias whatami='cat /etc/hostname'
alias temps='watch -n .1 sensors'
alias getip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias rip='grep --color=auto'
alias m='mousepad '
alias gstat='git status'
alias gpull='git pull'
alias gpush='git push origin main'
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
#alias p="python3"
alias ff='firefox'
alias enlarge_tmp='sudo mount -o remount,size=16G /tmp/'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
#alias topdf='wkhtmltopdf'
#alias sxiv='sxiv -b'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias jctl="journalctl -p 3 -xb"
alias sysupgrade="sudo pacman -Syyu"

#games
alias nfsmw='cd ~/games/nfsmw; wine speed.exe'
#alias deusex='cd ~/games/Deus_Ex/System; wine DeusEx.exe'
alias halflife='cd ~/games/HL1/; wine Launch\ HL1.exe'
alias bdoom='flatpak run org.zdoom.GZDoom -file brutalv21.pk3'
alias mc='java -jar ~/games/mc.jar'

# Emacs
#alias em="/usr/bin/emacs -nw"
#alias vim="emacsclient -t"
alias et="emacsclient -t"
alias em="emacsclient -c -a 'emacs'"
alias ed="emacsclient -c -n"
alias vi='vim'
alias startemacs="emacs --daemon"
alias hardkillemacs="emacsclient -e '(kill-emacs)'"
alias killemacs="emacsclient -c -n -a 'emacs' -e '(save-buffers-kill-emacs)'"

#alias botnet="google-chrome-stable"
#alias config_emacs="./configure --disable-silent-rules --with-modules --with-file-notification=inotify --with-mailutils --with-x=yes --with-x-toolkit=gtk3 --with-xwidgets --with-lcms2 --with-imagemagick --with-xml2 --with-json --with-harfbuzz --with-nativecomp CFLAGS='-O3'"
alias isemacsrun="ps aux | grep emacs"
#alias fuckoff='sudo alsa force-reload && pulseaudio -k && rm -rf ~/.config/pulse/ && pulseaudio -k'

#alias init_rvm='source /home/diamond/.rvm/scripts/rvm'

alias serve='python3 -m http.server'
alias ramdir='sudo mount -t tmpfs tmpfs /mnt/ram -o size=8192m'
#alias vpn='sudo protonvpn c'

alias calc='python3'

alias ssh_termux='ssh -p 8022 192.168.43.1'

alias pdf_strip='exiftool -all:all='

alias sexit='sync; exit'
#alias blur="picom --blur-method dual_kawase --blur-strength 8"

alias kmn=sexit
alias ENDMEPLS="systemctl poweroff"

alias mpcu='mpc update'

alias flightoff='sudo rfkill unblock all'
alias flighton='sudo rfkill block all'

alias cpr='rsync -ah --info=progress2'
alias mute='amixer set Master mute'
alias unmute='amixer set Master unmute && amixer set Headphone unmute'
alias open='xdg-open'
alias mypath='echo $PATH | tr -s ":" "\n"'

alias pubip='dig @1.1.1.1 ch txt whoami.cloudflare +short | cut -d\" -f 2'

alias topcpu='sudo ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'
alias topfiles='find $HOME -type f -exec du -Sh {} + | sort -rh | head'
alias topmem='sudo ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
alias topof='sudo lsof 2>/dev/null | cut -d" " -f1 | sort | uniq -c | sort -r -n | head'

alias diskscan='ncdu'
