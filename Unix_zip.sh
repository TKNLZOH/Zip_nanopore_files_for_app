#!/bin/bash

# Loop through each directory in the current folder
for dir in */ ; do
    dir="${dir%/}"  # remove trailing slash
    cd "$dir" || continue
    
    # Check if there are any .fastq.gz files
    shopt -s nullglob
    files=(*.fastq.gz)
    if [ ${#files[@]} -gt 0 ]; then
        zip "../${dir}.zip" *.fastq.gz
    fi
    
    cd ..
done
