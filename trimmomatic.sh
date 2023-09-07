#!/bin/bash

#This script takes raw Illumina .fq files and trims them with trimmomatic. Default trimming parameters used: http://www.usadellab.org/cms/?page=trimmomatic
#Dependency: trimmomatic-0.39.jar - http://www.usadellab.org/cms/?page=trimmomatic.
#Must enter path to trimmomatic -0.39.jar below
#How to run: bash trimmomatic.sh Path_to_/Forward_strand.fq.gz Path_to_/Reverse_strand.fq.gz
#August 15th. Timothy Lam. timothy2000lam@gmail.com


# Input file names for forward and reverse reads
forward_read=$1
reverse_read=$2

# Name the outputs after input suffixes
trimmed_paired_forward=${forward_read%%.*}_trimmed_paired.fastq.gz
trimmed_unpaired_forward=${forward_read%%.*}_trimmed_unpaired.fastq.gz
trimmed_paired_reverse=${reverse_read%%.*}_trimmed_paired.fastq.gz
trimmed_unpaired_reverse=${reverse_read%%.*}_trimmed_unpaired.fastq.gz

# Run Trimmomatic with the given inputs and outputs
java -jar /Path/To/trimmomatic-0.39.jar PE $forward_read $reverse_read $trimmed_paired_forward $trimmed_unpaired_forward $trimmed_paired_reverse $trimmed_unpaired_reverse ILLUMINACLIP:TruSeq2-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36

