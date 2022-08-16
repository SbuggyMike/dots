#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aow
[[ -f $HOME/artwar.1b.txt ]] && cd $HOME && grep ^[1-9] artwar.1b.txt >> tmp.txt &&  head -n  $(( $SRANDOM % $( grep ^[1-9] artwar.1b.txt | wc -l ) )) tmp.txt | tail -1 && rm tmp.txt

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

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
