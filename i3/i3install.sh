#!/bin/sh
# install the latest version of i3config

if [[ -f i3config ]] 
then
	if [[ -f ~/.config/i3/config ]] 
	then 
		rm ~/.config/i3/config
	fi
	cp i3config ~/.config/i3/config	
else
	echo "No config file found."
fi
