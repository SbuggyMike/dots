#!/bin/bash

if ! command -v curl >& /dev/null; then
  echo "Please install curl"
  exit 1
fi

if ! command -v pandoc >& /dev/null; then
  echo "Please install pandoc"
  exit 1
fi

# find the right directory

if [[ -d $1 ]]; then
  cd $1
elif [[ -d $HOME/misc_law/uk/ ]]; then
  cd $HOME/misc_law/uk/
else
  mkdir -p $HOME/uk/ && cd $HOME/uk/
fi
  
# Work out the year 

year=$(date +%Y)

url="https://www.bailii.org/uk/cases/UKSC/"$year"/"

# get case list

curl -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)" $url | grep -E '\sv\s' | awk -F '"' '{ print "https://www.bailii.org" $2}'  >> case_list

# download files

for i in $(cat case_list)
do
  output=$(echo $i | cut -d '/' -f 8)
  curl -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)" $i -o $output
  pandoc -f html -t plain $output -o $output".txt"
  name=$(grep -m1 -E "\(Appellant" $output".txt")" v "$(grep -m1 -E "\(Respondent" $output".txt")
  mv $output".txt" "$name"
  rm $output
done

