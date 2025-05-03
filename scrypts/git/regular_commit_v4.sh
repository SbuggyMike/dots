#! /bin/bash

start=$(pwd)

if [[ $# -eq 1 ]]
then
	working_dir=$1
else
	working_dir=$start
fi

for i in $(ls -1)
do
	if [[ -d $i ]]
	then
		cd $i 
		if [[ -d .git ]]
		then
			echo "Repository in " $i
			git add *
			git commit -a -m "Regular commit on  $(date +%d.%m.%Y)"


