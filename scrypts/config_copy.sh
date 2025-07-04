#! /bin/bash

name=$(date +%b_%y)

if [[ -d /home/hector/.config  && -d /home/hector/dots/configs ]]
then
  cd /home/hector/dots/configs &&
  mkdir $name &&
  cp -r /home/hector/.config/* /home/hector/dots/configs/$name
  chown -R hector /home/hector/dots/configs/*
fi

if [[ -f /home/hector/.bashrc && -d /home/hector/dots/bashrc ]]
then
  cp /home/hector/.bashrc /home/hector/dots/bashrc/$name
  chown hector /home/hector/dots/bashrc/*
fi

if [[ -f /home/hector/.xinitrc && -d /home/hector/dots/xinitrc ]]
then
  cp /home/hector/.xinitrc /home/hector/dots/xinitrc/$name
  chown -R hector /home/hector/dots/xinitrc/*
fi

echo $(date) ": Copied config files" >> /home/hector/dots/log




