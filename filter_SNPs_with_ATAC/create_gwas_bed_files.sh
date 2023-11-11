#thresholded
#python create_gwas_bed_files.py --gwas /Users/shaotingting/Library/CloudStorage/OneDrive-Personal/tingtingshao/masterThesis/data/Alzheimers_Kunkle_2019/Alzheimers_Kunkle_2019.txt.gz --out_prefix Kunkle.1e-5 --append --pval_thresh 1e-5
#python create_gwas_bed_files.py --gwas mgloud_GWAS/23andme_PD.txt.gz --out_prefix 23andme.1e-5 --pval_thresh 1e-5
#not thresholded
python create_gwas_bed_files.py --gwas /Volumes/USB/mater_thesis_data/GWAS_catalog/Kunkle_etal_Stage1_results.txt.gz --pval_thresh 1e-5 --out_prefix /Volumes/USB/mater_thesis_data/GWAS_catalog/Kunkle_1e-5 #--append 
#python create_gwas_bed_files.py --gwas mgloud_GWAS/23andme_PD.txt.gz --out_prefix 23andme 


