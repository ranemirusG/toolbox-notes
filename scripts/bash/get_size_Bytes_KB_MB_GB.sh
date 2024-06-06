#!/bin/bash

# Function to get the size of a directory in bytes
get_directory_size() {
    local path="$1"
    if [ -d "$path" ]; then
        du -sb "$path" | cut -f1
    else
        echo 0
    fi
}

# Function to format size into KB, MB, GB
format_size() {
    local size="$1"
    printf "%s\t%.2f\t%.2f\t%.2f\n" "$size" "$(echo "scale=2; $size / 1024" | bc)" "$(echo "scale=2; $size / 1048576" | bc)" "$(echo "scale=2; $size / 1073741824" | bc)"
}

# List directories and their sizes
list_directory_sizes() {
    for entry in *; do
        if [ -d "$entry" ]; then
            size=$(get_directory_size "$entry")
        elif [ -f "$entry" ]; then
            size=$(stat --printf="%s" "$entry")
        else
            size=0
        fi
        echo -e "$(format_size $size)\t$entry"
    done | sort -nr
}

# Print header
echo -e "Size(Bytes)\tSize(KB)\tSize(MB)\tSize(GB)\tName"

# List directories and files
list_directory_sizes | column -t
