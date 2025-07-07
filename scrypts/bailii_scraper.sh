#!/bin/bash

if ! command -v curl >& /dev/null; then
  echo "Please install curl"
  exit 1
fi

if ! command -v pandoc >& /dev/null; then
  echo "Please install pandoc"
  exit 1
fi

# function to download files into correct directory

function download () { 
	echo $1
	echo $2
	# find the right directory
	
	if [[ -d $1 ]]; then
	  cd $1
	elif [[ -d $HOME/misc_law/uk/$2 ]]; then
	  cd $HOME/misc_law/uk/$2
	else
	  mkdir -p $HOME/misc_law/uk/$2 && cd $HOME/misc_law/uk/$2
	fi

	echo "Now in" $(pwd)
	
	# find out if there is a log file
	
	if [[ ! -f .log ]]; then
		echo "Log file created"
		touch .log
	fi
	  
	# Work out the year 
	
	year=$(date +%Y)

	case $2 in 
		"sc") 
			url="https://www.bailii.org/uk/cases/UKSC/"$year"/" ;;
		"ewca")
			url="https://www.bailii.org/ew/cases/EWCA/Civ/"$year"/" ;;
	esac
	
	# get case list
	
	curl -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)" $url | grep -E '\sv\s' | awk -F '"' '{ print "https://www.bailii.org" $2}'  >> case_list
	
	# download files; only take new ones
	
	for i in $(cat case_list)
	do
	  if ! grep -q $i .log; then
		  echo $i >> .log
		  output=$(echo $i | cut -d '/' -f 8)
		  curl -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)" $i -o $output
		  pandoc -f html -t plain $output -o $output".txt"
		  case $2 in 
			  "sc" )
				  name=$(grep -m1 -E "\(Appellant" $output".txt")" v "$(grep -m1 -E "\(Respondent" $output".txt") ;;
			  "ewca" )
				  name=$(grep -m1 "Neutral Citation Number" $output".txt" | cut -d ":" -f "2" | xargs) 
				  if grep -q -E "ON APPEAL FROM.*BUSINESS" $output".txt"; then
					  echo $name >> read_list
				  fi ;;
		  esac
		  mv $output".txt" "$name"
		  rm $output
		  echo "Downloaded" $name
	  else
		  echo "Skipping " $i
	  fi
	done
	
	# change ownership
	
	for i in "$(ls)"
	do
		chown hector $i
	done
}

# call function for UKSC cases
download "$1" "sc"

# call function for EWCA cases
download "$1" "ewca"

