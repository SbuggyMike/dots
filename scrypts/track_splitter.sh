#!/bin/bash

start_dir=$(pwd)

# Iterate over all directories in the target directory
find . -type d | while read -r dir; do
    # Count the number of .cue and .flac files in the current directory
    cue_count=$(find "$dir" -maxdepth 1 -type f -name "*.cue" | wc -l)
    flac_count=$(find "$dir" -maxdepth 1 -type f -name "*.flac" | wc -l)
    
    # Check if the directory contains exactly one .cue and one .flac file
    if [ "$cue_count" -eq 1 ] && [ "$flac_count" -eq 1 ]; then
        echo "Directory '$dir' contains exactly one .cue and one .flac file."

        # Perform your desired operations here
        # Example: echo the paths of the .cue and .flac files
        cue_file=$(find "$dir" -maxdepth 1 -type f -name "*.cue")
        flac_file=$(find "$dir" -maxdepth 1 -type f -name "*.flac")

        echo "CUE File: $cue_file"
        echo "FLAC File: $flac_file"

	cue_filename=$(basename "$cue_file")
	flac_filename=$(basename "$flac_file")

	cd "$dir" || continue

	shnsplit -f "$cue_filename" -o flac "$flac_filename"
	cuetag.sh "$cue_filename" split*flac

	cd "$start_dir" || exit
    else
        echo "Directory '$dir' does not meet the criteria."
    fi
done

