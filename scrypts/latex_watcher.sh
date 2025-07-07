#!/bin/bash

if ! command -v pdflatex --help >> /dev/null; then
	echo "Please install pdflatex."
	exit 1
fi

echo $1

if [[ -z $1 ]]; then
	echo "Please give the name of a file."
	exit 1
fi

if [[ ! -f $1 ]]; then
	echo "No valid file with name" $1 "found."
	exit 1
fi

cp $1 $1.tmp

while true; do
	if ! diff $1 $1.tmp; then
		pdflatex -interaction=nonstopmode -halt-on-error $1
		cp $1 $1.tmp
	fi
	sleep 30s
done
