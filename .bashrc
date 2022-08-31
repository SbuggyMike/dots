#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/scrypts
thirty

# aow
# [[ -f $HOME/artwar.1b.txt ]] && cd $HOME && grep ^[1-9] artwar.1b.txt >> tmp.txt &&  head -n  $(( $SRANDOM % $( grep ^[1-9] artwar.1b.txt | wc -l ) )) tmp.txt | tail -1 && rm tmp.txt

# cd into directory simply by typing it
shopt -s autocd cdspell

# vim keybindings
set -o vi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ddg="w3m duckduckgo.com"
alias f="find -iname"
alias g="groff -Tpdf -ms"
alias m="mupdf"
alias mu="if [[ -d /mnt/musix/ ]]; then cd /mnt/musix; else printf 'No music folder found'; fi"
alias p="sudo pacman"
alias porg="pandoc -f org -t ms -o"
alias reload="source ~/.bashrc"
alias v="vim"
alias stop="systemctl suspend"
alias s="source $HOME/.bashrc"
alias weath="curl wttr.in"
alias y="yay -Syu"

