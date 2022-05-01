#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# english and swap escape
setxkbmap -layout gb -option caps:swapescape

# vim keybindings
set -o vi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias stop="systemctl suspend"
alias ddg="w3m duckduckgo.com"
alias z="zathura"

