#!/bin/bash
#This script reports the average length of each read in a fastq.gz file.
#How to run: bash avg_length.sh Path/To/file.fastq.gz
#August 15th. Timothy Lam. timothy2000lam@gmail.com

file_path="$1"
total_length=0
total_sequences=0

# Check if a file path was provided as an argument
if [ -z "$file_path" ]; then
  echo "Error: Please provide the path to the FASTQ file as an argument."
  exit 1
fi

# Check if the file exists
if [ ! -f "$file_path" ]; then
  echo "Error: File not found: $file_path"
  exit 1
fi

# Read the FASTQ file and calculate the total length and number of sequences
while read -r line; do
  ((total_sequences++))
  read -r sequence_line
  ((total_length += ${#sequence_line}))
  read -r _ _  # Discard the other two lines
done < "$file_path"

# Calculate the average length
if [ "$total_sequences" -gt 0 ]; then
  average_length=$(bc <<< "scale=2; $total_length / $total_sequences")
  echo "Average sequence length: $average_length bases"
else
  echo "No sequences found in the FASTQ file."
fi

