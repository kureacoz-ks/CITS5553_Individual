#!/bin/bash

# Specify the directory to search for PDF files
search_dir="D:/UWA/cits5553/Dataset/Bash_trial"
# search_dir="WAMEX_DATA_EXTRACTED"

# Find all sub-directories within the search directory
while IFS= read -r -d '' sub_dir; do

    # Finding all ZIP files in the subdirectory
    while IFS= read -r -d '' zip_file; do

        # Loading in the sub-directory when a ZIP file is spotted
        dest_dir="${sub_dir}"

        # Create a temp dir and extract ZIP file content into it
        temp_dir=$(mktemp -d)
        unzip -q "$zip_file" -d "$temp_dir"

        # Finding PDFs within extracted files
        while IFS= read -r -d '' pdf_file; do

            # Copy the PDF file to its corresponding subdirectory
            cp "$pdf_file" "$dest_dir"

        done < <(find "$temp_dir" -type f -name "*.pdf" -print0)

    done < <(find "$sub_dir" -type f -name "*.zip" -print0)

done < <(find "$search_dir" -mindepth 1 -type d -print0)
