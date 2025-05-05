#! /bin/bash

start=$(pwd)

if [[ $# -eq 1 ]]
then
	working_dir=$1
else
	working_dir=$start
fi

cd $working_dir

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
			git push
		fi
    cd $working_dir
	fi
done

echo $(date) ": Performed regular commit" >> /home/$USER/dots/log
