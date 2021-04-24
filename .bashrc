#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#alias cp="cp -i"                          # confirm before overwriting something
alias more=less

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
	. /home/diamond/.bash_aliases
fi

# git config --global core.editor "vim"
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR="$VISUAL"

# Enable history appending instead of overwriting.  #139609
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

# set PATH
PATH="$HOME/.emacs.d/bin:$HOME/.local/bin:$HOME/bin:/opt/android-studio/bin:/$HOME/Android/Sdk/tools/bin:$PATH"

# Android SDK
export ANDROID_SDK_ROOT=/home/diamond/Android/Sdk
export JAVA_HOME=/opt/android-studio/jre

# from YetiDesk
export __GL_SHADER_DISK_CACHE_PATH=$HOME/.cache
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1

# set shell prompt
#export PS1='\[\e]0;\w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;           +++32m\]\[\033[00m\] \w 'PS1='[\u@\h \W]\$ '
#export PS1=" λ \W\[$(tput sgr0)\] "

video2gif() {
  ffmpeg -y -i "${1}" -vf fps=${3:-10},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
  ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
  rm "${1}.png"
}

