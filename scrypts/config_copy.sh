#! /bin/bash

name=$(date +%b_%y)

if [[ -d /home/$USER/.config  && -d /home/$USER/dots/configs ]]
then
  cd /home/$USER/dots/configs &&
  mkdir $name &&
  cp -r /home/$USER/.config/* /home/$USER/dots/configs/$name
fi

if [[ -f /home/$USER/.bashrc && -d /home/$USER/dots/bashrc ]]
then
  cp ~/.bashrc /home/$USER/dots/bashrc/$name
fi

if [[ -f /home/$USER/.xinitrc && -d /home/$USER/dots/xinitrc ]]
then
  cp ~/.xinitrc /home/$USER/dots/xinitrc/$name
fi

echo $(date) ": Copied config files" >> /home/$USER/dots/log




