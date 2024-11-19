#!/bin/bash

# Define the source directory
src_dir="icons"

# Check if the source directory exists
if [ ! -d "$src_dir" ]; then
  echo "Directory $src_dir does not exist!"
  exit 1
fi

# Loop through each file in the icons directory
for file in "$src_dir"/*; do
  # Check if it's a file (not a directory)
  if [ -f "$file" ]; then
    # Extract the first letter of the file name (lowercase for consistency)
    first_letter=$(basename "$file" | cut -c 1 | tr 'A-Z' 'a-z')
    
    # Create a directory named with the first letter, if it doesn't exist
    dest_dir="$src_dir/$first_letter"
    if [ ! -d "$dest_dir" ]; then
      mkdir "$dest_dir"
    fi
    
    # Move the file into the appropriate subdirectory
    mv "$file" "$dest_dir/"
    echo "Moved $file to $dest_dir/"
  fi
done

echo "All files have been organized!"
