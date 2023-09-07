#!/bin/bash
#This script iteratively checks ANI of your potentially novel isolate against a directory of user-supplied genomes. Recommended for checking ANI against its most common relatives.
#HOW TO RUN: 
# bash ANI_check.sh /path/to/novel_isolate_genome.fasta /path/to/directory_of_genomes

###NOTE: You'll need to edit /mnt/c/Users/timot/Desktop/Summer_Project/ANI/ with the path to the OAU.jar and usearch11 files on your machine.
#Find dependancies and OAU.jar at: https://help.ezbiocloud.net/oau-manual/

#August 15th. Timothy Lam. timothy2000lam@gmail.com


# Check if the required arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: ./ANI_check.sh PATH/TO/FIRST_GENOME.fasta PATH/TO/DIRECTORY_OF_GENOMES"
    exit 1
fi

# Store the arguments in variables
FIRST_GENOME=$1
GENOME_DIRECTORY=$2

# Create the output file name
OUTPUT_FILE="ANI_check_out.txt"

# Remove the output file if it already exists
if [ -f "$OUTPUT_FILE" ]; then
    rm "$OUTPUT_FILE"
fi

# Loop through all files in the genome directory
for genome_file in "$GENOME_DIRECTORY"/*.fasta; do
    if [ "$genome_file" != "$FIRST_GENOME" ]; then
        # Run the Java command with the current genome file and append the output to the output file
        java -jar /mnt/c/Users/timot/Desktop/Summer_Project/ANI/OAU.jar -u /mnt/c/Users/timot/Desktop/Summer_Project/ANI/usearch11.0.667_i86linux32 -f1 "$FIRST_GENOME" -f2 "$genome_file" >> "$OUTPUT_FILE"
    fi
done

echo "ANI check completed. Results saved to $OUTPUT_FILE"

