#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vim keybindings
set -o emacs

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ddg="w3m duckduckgo.com"
alias killemacs="ps -e | grep 'emacs' | awk '{print $1}' | xargs kill -9"
alias p="sudo pacman -Syu"
alias stop="systemctl suspend"
alias y="yay -Syu"
alias z="zathura"

