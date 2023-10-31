#!/bin/bash

# Specify the directory to search in
search_dir="D:/UWA/cits5553/Dataset/Kose/93175"

# Create an array to store the PDF file paths

declare -a pdf_files=()

# Find all PDF files in the directory and its subdirectories
find "$search_dir" -type f -name "*.pdf" -print0 | while IFS= read -r -d '' pdf_file; do
	echo "$pdf_file"
	pdf_files+=("$pdf_file")
done

# Find all ZIP files in the directory and its subdirectories
#find "$search_dir" -type f -name "*.zip" -print0 | while IFS= read -r -d '' zip_file; do
#    # Create a temporary directory to extract ZIP files
#    temp_dir=$(mktemp -d)
#
#    # Extract the ZIP file to the temporary directory
#    unzip -q "$zip_file" -d "$temp_dir"
#
#    # Find PDF files within the extracted ZIP file and add them to the array
#    find "$temp_dir" -type f -name "*.pdf" -print0 | while IFS= read -r -d '' pdf_file; do
#        pdf_files+=("$pdf_file")
#    done
#
#    # Remove the temporary directory
#    rm -r "$temp_dir"
#done

# Print the list of PDF files
for pdf_file in "${pdf_files[@]}"; do
    echo "$pdf_file"
done

#echo pdf_files
