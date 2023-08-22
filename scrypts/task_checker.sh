#/bin/bash

case $(( $(date +%d) / 7 )) in
	0) echo "Week 1" ;;
	1) echo "Week 2" ;;
	2) echo "Week 3" ;;
	3) echo "Week 4" ;;
	4) echo "Week 5" ;;
esac

if [[ $1 > 0 ]]
then
	dotw=$1
else
	dotw=$(date +%u)
fi

grep "DAILY" habits.txt

case $dotw in 
	1) grep "MON" habits.txt ;;
	2) grep "TUE" habits.txt ;;
	3) grep "WED" habits.txt ;;
	4) grep "THU" habits.txt ;;
	5) grep "FRI" habits.txt ;;
	6) grep "SAT" habits.txt ;;
	7) grep "SUN" habits.txt ;;
esac
