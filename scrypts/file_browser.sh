#!/bin/bash

if [[ -x /usr/bin/nvim ]]; then
  EDITOR=/usr/bin/nvim 
elif [[ -x /usr/bin/vim ]]; then
  EDITOR=/usr/bin/vim 
else
  EDITOR=/usr/bin/vi 
fi

if ! command -v dmenu 2&>1 /dev/null
then
  echo "Please install dmenu."
  exit 1
fi 

if [[ -d $1 ]]; then
  cd $1
fi 

while [[ true ]]; do

  select=$( ls -a | dmenu -l 30 -fn JetBrainsMonoFontNerd )

  if [[ -d $select ]]; then
    cd "$select"
  else
    if [[ $select =~ .*\.sh ]]; then
      $EDITOR $select
      exit 0
    else
      xdg-open "$select" 
     exit 0
    fi
  fi
done


 
