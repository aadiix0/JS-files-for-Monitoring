#!/bin/bash

# Check for directory argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory_to_scan>"
  exit 1
fi

SCAN_DIR=$1
RESULTS_FILE="scan_results.txt"
REGEX_DIR="regex_patterns"

# Clear previous results
> "$RESULTS_FILE"

# Function to run scanner for a category
scan_category() {
  local category_name=$1
  local regex_file="${REGEX_DIR}/${category_name}.txt"

  if [ -f "$regex_file" ]; then
    echo "--- SCANNING FOR ${category_name^^} ---" >> "$RESULTS_FILE"
    # Using grep -rEoh -f <pattern_file> <scan_dir>
    # -r: recursive
    # -E: extended regex
    # -o: print only the matching part of the lines
    # -h: suppress the prefixing of file names on output
    # -f: obtain patterns from file
    grep -rEoh -f "$regex_file" "$SCAN_DIR" >> "$RESULTS_FILE"
    echo "" >> "$RESULTS_FILE" # Add a newline for spacing
  fi
}

# Run the scanner for each category
scan_category "links"
scan_category "parameters"
scan_category "suspicious_params"
scan_category "endpoints"
scan_category "misc"

echo "Scanning complete. Results are in $RESULTS_FILE"
