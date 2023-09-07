#!/bin/bash
#This script takes forward and reverse Illumina reads and ONT long reads and performs short read first hybrid assembly saving the output to the specified output directory
# Usage: bash unicycler.sh <short_reads_1> <short_reads_2> <long_reads> <output_dir>
#Dependencies: Unicycler v0.5.0 - https://github.com/rrwick/Unicycler/releases, SPAdes 3.15.5 - https://github.com/ablab/spades/releases, racon 1.5.0 - https://github.com/lbcb-sci/racon, ncbi-blast-2.14.0+ - https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/.  
#August 15th. Timothy Lam. timothy2000lam@gmail.com

# check if four arguments are provided
if [[ $# -ne 4 ]]; then
    echo "Usage: $0 <short_reads_1> <short_reads_2> <long_reads> <output_dir>"
    exit 1
fi

# assign variables
short_reads_1="$1"
short_reads_2="$2"
long_reads="$3"
output_dir="$4"

# run unicycler
unicycler -1 "$short_reads_1" -2 "$short_reads_2" -l "$long_reads" -o "$output_dir" #Can specify paths to racon, SPAdes, and BLAST+ if they are not added to path. 