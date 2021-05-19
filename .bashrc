#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias weather='curl wttr.in/finchley ; curl v2.wttr.in/finchley'
alias bt='mutt -F ~/mail/bt/btconfig'
alias ucl='mutt -F ~/mail/ucl/uclconfig'
alias shh='systemctl suspend'
alias menelaus='ssh menelaus@192.168.1.130' 
alias update='sudo pacman -Syu'
alias vimpv='mpv --no-terminal --force-window'
declare PATH=$PATH$":/home/achilles/scrypts"
declare BROWSER=/usr/bin/w3m
PS1='[\u@\h \W]\$ '
setxkbmap -option caps:swapescape
xrandr --output HDMI-1 --left-of DVI-D-1
# xrandr --output DP-1 --right-of DVI-D-1

# start xorg automatically
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then 
#	exec startx
#fi
