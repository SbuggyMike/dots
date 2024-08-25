#!/bin/bash

# Copy files over to dots
cp ~/.vimrc ~/dots/

# Get the current date
DATE=$(date)

# List of repositories
REPOS=("/home/telemachus/phd_law" "/home/telemachus/misc_law" "/home/telemachus/life_org" "/storage/spare_home/bvs" "/home/telemachus/dots" "/home/telemachus/roam" "/storage/spare_home/hustle")

# Loop over each repository
for REPO in "${REPOS[@]}"
do
    # Navigate to the repository
    cd $REPO
    echo "Changed to" $(pwd)

    # Add any new files
    git add .

    # Commit changes with a commit message of "regular commit on DATE"
    git commit -m "regular commit on $DATE"

    # Push the commit
    git push
done
