#!/bin/bash

# Show help if requested
if [[ "$1" == "--help" ]]; then
    echo "Usage: $0 [-n] [-v] search_string filename"
    exit 0
fi

# Check if enough arguments are given
if [[ $# -lt 2 ]]; then
    echo "Error: Missing search string or filename."
    echo "Usage: $0 [-n] [-v] search_string filename"
    exit 1
fi

# Default options
show_line_numbers=false
invert_match=false

# Check if first argument is an option
if [[ "$1" == -* ]]; then
    [[ "$1" == *n* ]] && show_line_numbers=true
    [[ "$1" == *v* ]] && invert_match=true
    shift
fi

# Set search string and filename
search_string="$1"
filename="$2"

# Check if file exists
if [[ ! -f "$filename" ]]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

# Start reading file
line_number=0
while IFS= read -r line; do
    ((line_number++))

    # Check if line matches search string (case insensitive)
    echo "$line" | grep -i -q "$search_string"
    match=$?

    if $invert_match; then
        # Print lines that do NOT match
        if [[ $match -ne 0 ]]; then
            $show_line_numbers && echo "${line_number}:$line" || echo "$line"
        fi
    else
        # Print matching lines
        if [[ $match -eq 0 ]]; then
            $show_line_numbers && echo "${line_number}:$line" || echo "$line"
        fi
    fi
done < "$filename"
