#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias stop="systemctl suspend"
alias ddg="w3m duckduckgo.com"

setxkbmap -layout gb -option caps:swapescape
