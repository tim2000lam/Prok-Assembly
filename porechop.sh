#!/bin/bash
#This script takes a ONT .fq.gz file and applies porechop to remove adapters, saving the output as porechop_out_BASENAME.fastq.gz
#Dependency: Porechop 0.2.4 - https://github.com/rrwick/Porechop
#How to run: bash porechop.sh Path/to/input_ONT.fastq.gz
#August 15th. Timothy Lam. timothy2000lam@gmail.com

# Check if an argument was passed
if [ $# -eq 0 ]
  then
    echo "No input file name provided"
    exit 1
fi

# Extract input file name without path and extension
input_filename=$(basename "$1")
input_filename="${input_filename%.*}"

# Generate output file name
output_filename="porechop_out_${input_filename}.gz"

# Run porechop with input and output file names
porechop -i "$1" -o "$output_filename"

