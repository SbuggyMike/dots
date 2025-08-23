#!/bin/bash

if ! command -v pandoc; then
	echo "Please install pandoc"
	exit 1
fi


if ! command -v curl; then
	echo "Please install curl"
	exit 1
fi

if [[ -d $1 ]]; then
	cd $1
elif [[ -d "$HOME/misc_law/cpr" ]]; then
	cd "$HOME/misc_law/cpr"
else
	mkdir -p "$HOME/misc_law/cpr"
	cd "$HOME/misc_law/cpr"
fi

