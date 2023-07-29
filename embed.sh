#!/bin/bash

# Check if the required argument is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <image_path> <metadata_json_file>"
    exit 1
fi

image_path="$1"
metadata_json_file="$2"

# Read metadata from the JSON file
metadata_json=$(cat "$metadata_json_file")

# Embed metadata using exiftool
exiftool -overwrite_original -Comment="$metadata_json" "$image_path"

echo "Metadata embedded successfully."
