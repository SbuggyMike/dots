#! /bin/bash
# This script finds albums based on the search result added as $1. 


if lsblk | grep '/mnt' > /dev/null
then
    cd /mnt/
    if [[ -d ./musix ]]
    then
	cd musix
    elif [[ -d ./music ]]
    then
	cd music
    else
	echo "No music folder found!"
	lsblk
	exit
    fi
else
    echo "No music device mounted!"
    exit
fi

if (( $# != 1 ))
then
    echo "Wrong number of arguments"
fi

results=$(find . -type d -iname "*$1*")
count=$(echo "$results" | wc -l)

if [ "$count" -eq 1 ]; then
    echo "Playing album found in: $results"
    mpv "$results"/*.flac
else
    echo "Multiple or no results found:"
    echo "$results"
fi


	
