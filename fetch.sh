#!/bin/bash

# Check if the required argument is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <image_path> <output_txt_file>"
    exit 1
fi

image_path="$1"
output_txt_file="$2"

# Fetch metadata using exiftool
metadata_json=$(exiftool -Comment "$image_path" | awk -F': ' '{print $2}')

# Check if metadata is empty or not
if [ -z "$metadata_json" ]; then
    echo "No metadata found in the image."
    exit 1
fi

# Save the fetched metadata into the output text file
echo "$metadata_json" > "$output_txt_file"

echo "Metadata fetched and saved to $output_txt_file successfully."
