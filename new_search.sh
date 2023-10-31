#!/bin/bash

# Accepting the argument as input directory
search_dir="$1"

# Array to store pdf file paths
declare -a pdf_files=()

# Finding all ZIP files in the directory and its subdirectories
while IFS= read -r -d '' zip_file; do
    # Temp directory to keep extracted ZIP files
    temp_dir=$(mktemp -d)

    # Extracting ZIP files
    unzip -q "$zip_file" -d "$temp_dir"

    # Finding PDFs within extrated files and copying them to directory
    while IFS= read -r -d '' pdf_file; do
       cp "$pdf_file" "$search_dir"
    done < <(find "$temp_dir" -type f -name "*.pdf" -print0)

    # Cleaning up temp directory
    rm -r "$temp_dir"

done < <(find "$search_dir" -type f -name "*.zip" -print0)

# Adding all PDF file paths to array
while IFS= read -r -d '' pdf_file; do
    pdf_files+=("$pdf_file")
done < <(find "$search_dir" -type f -name "*.pdf" -print0)


# Printing final array
for pdf_file in "${pdf_files[@]}"; do
    echo "$pdf_file"
done
