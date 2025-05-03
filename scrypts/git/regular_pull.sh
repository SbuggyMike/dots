#!/bin/bash

# List of repositories
REPOS=("phd_law" "misc_law" "life_org" "bvs" "dots" "roam" "hustle")

# Loop over each repository
for REPO in "${REPOS[@]}"
do
    # Navigate to the repository
    cd ~/$REPO
    echo "Changed to" $(pwd)

    git pull
done
