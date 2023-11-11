#!/bin/bash

# Input and output file paths
path="/Volumes/USB/mater_thesis_data/GWAS_catalog/"
input_file="$path""Kunkle.example.expanded.bed"
output_file="$path""Kunkle.example.expanded.long.bed"
result1="$path""Kunkle.example.expanded.long.filtered.f1.bed"
result2="$path""Kunkle.example.expanded.long.filtered.bed"
peaks_file="$path""peaks.bed"

# Step 1: Extract relevant columns and create the long file
awk -v OFS='\t' '{print $1, $2, $3, $7, $8}' "$input_file" > "$output_file"
awk -v OFS='\t' '{print $4, $5, $6, $7, $8}' "$input_file" >> "$output_file"

bedtools intersect -wa -wb -a "$output_file" -b "$peaks_file" -f 1.0 > "$result1"
bedtools intersect -wa -wb -a "$output_file" -b "$peaks_file"  > "$result2"