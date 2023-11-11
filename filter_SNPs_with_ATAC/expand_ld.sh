#!/bin/bash


#python expand_ld.py --snp_pos_bed_file /Users/shaotingting/Library/CloudStorage/OneDrive-Personal/tingtingshao/masterThesis/data/Alzheimers_Kunkle_2019/Kunkle.1e-5.bed \
#       --outf /Users/shaotingting/Library/CloudStorage/OneDrive-Personal/tingtingshao/masterThesis/data/Alzheimers_Kunkle_2019/Kunkle.1e-5.expandedupdate.bed &
#python expand_ld.py --snp_pos_bed_file 23andme.1e-5.bed \
#       --outf 23andme.1e-5.expanded.bed &

python expand_ld.py --snp_pos_bed_file /Volumes/USB/mater_thesis_data/GWAS_catalog/Kunkle.example.bed \
       --outf /Volumes/USB/mater_thesis_data/GWAS_catalog/Kunkle.example.expanded.bed 
#python expand_ld.py --snp_pos_bed_file 23andme.bed \
#       --outf 23andme.expanded.bed &
