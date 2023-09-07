#!/bin/bash
#This script counts the total number of reads in a fastq.gz file
#Dependency: seqtk 1.3-r106 - https://github.com/lh3/seqtk
#How to run: read_count.sh Path/To/ONT_reads.fastq.gz
#August 15th. Timothy Lam. timothy2000lam@gmail.com

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <fastq_file>"
  exit 1
fi

fastq_file=$1

seqtk seq -a "$fastq_file" | awk '{if(NR%2==1) {print $0}}' | wc -l

