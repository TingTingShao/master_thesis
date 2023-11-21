#!/bin/bash

# path="/Volumes/USB/mater_thesis_data/GWAS_catalog/"
# input_file="$path""Bellenguez_1e-1.bed"
# result1="$path""Bellenguez_1e-1.filtered.f1.bed"
# result2="$path""Bellenguez_1e-1.filtered.bed"
# peaks_file="$path""peaks.bed"

path="/Volumes/USB/mater_thesis_data/GWAS_catalog/"
input_file="$path""Kunkle_0.1.bed"
result1="$path""Kunkle_1e-1.filtered.f1.bed"
result2="$path""Kunkle_1e-1.filtered.bed"
peaks_file="$path""peaks.bed"

# Step 1: Extract relevant columns and create the long file
# awk -v OFS='\t' '{print $1, $2, $3, $7, $8}' "$input_file" > "$output_file"
# awk -v OFS='\t' '{print $4, $5, $6, $7, $8}' "$input_file" >> "$output_file"

# Step 2: Label the long file with the chromosome number
# awk '{print "chr"$0}' "$output_file" > "$output_file1"

# step3 intersect
bedtools intersect -wa -wb -a "$input_file" -b "$peaks_file" -f 1.0 > "$result1"
bedtools intersect -wa -wb -a "$input_file" -b "$peaks_file"  > "$result2"