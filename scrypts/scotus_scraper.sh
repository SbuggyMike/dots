#!/bin/bash

if ! command -v curl >& /dev/null; then
  echo "Please install curl"
  exit 1
fi

# create a variable for the curl command

scrape='curl -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)"'


# find the right directory

if [[ -d $1 ]]; then
  cd $1
elif [[ -d $HOME/misc_law/us/ ]]; then
  cd $HOME/misc_law/us/
else
  mkdir -p $HOME/us/ && cd $HOME/us/
fi
  
# Work out the year - if it's before october, the year will be last year's legal term

if (( $(date +%m) > 9 )); then
  year=$(date +%y)
else
  year=$(( $(date +%y) - 1))
fi

url="https://www.supremecourt.gov/opinions/slipopinion/"$year   

# get case list

curl $url | grep -E 'opinions.*pdf' | awk -F "'" '{ print "https://www.supremecourt.gov" $2}'  >> case_list

# download files

for i in $(cat case_list)
do
  output=$(echo $i | cut -d '/' -f 6) 
  curl $i -o $output
  shortname=$(echo $output | cut -d '.' -f 1)".txt"
  pdftotext $output 
  name="$(grep -m1 -E '^([A-Z]|\s|,|\.|\(|\)|/)+\sv\.\s[A-Z]*' $shortname)"
  echo $name
  mv $shortname "$name"
  mv $output "$name"".pdf"
done

rm case_list
