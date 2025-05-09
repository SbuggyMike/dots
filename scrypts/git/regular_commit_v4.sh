#! /bin/bash

# Nb all variable which would have made the script apply to any user have had to be change to allow anacron to work 

if [[ $# -eq 1 ]]
then
	working_dir=$1
else
	working_dir="/home/hector"
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
			git commit -a -m "Regular commit by Hector on  $(date +%d.%m.%Y)"
			git push
		fi
    cd $working_dir
	fi
done

echo $(date) ": Performed regular commit" >> /home/hector/dots/log
