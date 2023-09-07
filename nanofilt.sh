#!/bin/bash
#This script take a ONT .fq.gz file and applied nanofilt trimming and filtering to the reads, then saving the output as BASENAME-trimmed.fastq.gz
#Dependency: NanoFilt 2.8.0 - https://pypi.org/project/NanoFilt/
#How to run: bash nanofilt.sh path_to/input_ONT_read.fq.gz
#August 15th. Timothy Lam. timothy2000lam@gmail.com


# Check if an input file was provided
if [ -z "$1" ]; then
  echo "Please provide an input file name."
  exit 1
fi

# Set the input and output file names
INPUT_FILE="$1"
OUTPUT_FILE="$(basename "$INPUT_FILE" .fastq.gz)-trimmed.fastq.gz"

# Apply the NanoFilt tool to trim and filter the reads
zcat "$INPUT_FILE" | NanoFilt -q 12 --headcrop 75 | gzip > "$OUTPUT_FILE"

echo "Trimmed and filtered with NanoFilt. Reads saved in $OUTPUT_FILE."
