# master_thesis
## filter SNPs from GWAS stage1 result with ATAC peaks

- **Starting data**
	- Download source: GWAS catalog -> summary statistics -> Available studies [Kunkle_etal_Stage1_results.txt.gz](https://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST007001-GCST008000/GCST007511/)
	- Reference genome: LD matrices for 1000 genomes phase 1 files for EUR and YRI, [EUR_geno.txt.gz](https://zenodo.org/records/3404275#.Xlw62XVKhhE)
	- Peak file: peakTogene links (SupplementalTables.combined.xlsx, Sun et.al)
	- Kunkle_1e-5.bed: select the records with p value less than 1e-5; Kunkle_1e-5.expand.bed show no expansion.
	- Kunkle_5e-2.bed: select records with p value less than 5e-2;  Kunkle_5e-2.expand.bed show 497904 SNPs with expansion.
	- Kunkle.bed: select records with no filter; Kunkle.expand.bed show 8277306 SNPs with expansion.
- **Scripts**
	- 1. create_gwas_bed_files.sh
	- 2. expand_ld.sh
	- 3. readPeaks.py
	- 4. intersect.sh
```bash
cat Kunkle_1e-5.expanded.bed | head -n 5
19	45436215	45436216	19	45436215	45436216	rs7260330	9.983e-06
8	71692812	71692813	8	71692812	71692813	rs11988972	9.982e-06
4	66244869	66244870	4	66244869	66244870	rs28704613	9.967e-06
22	46713650	46713651	22	46713650	46713651	rs80119813	9.936e-06
6	32491825	32491826	6	32491825	32491826	rs114291379	9.93e-06
awk '$2!=$5{print $2,$5}' Kunkle.expanded.bed | wc -l
 8277306
awk '$2!=$5{print $2,$5}' Kunkle_1e-5.expanded.bed | wc -l
       0
awk '$2!=$5{print $2,$5}' Kunkle_5e-2.expanded.bed | wc -l
  497904
  
# small example
## before status
cat Kunkle.example.expanded.bed | head -n 2
chr12	41806259	41946923	chr12	41839413	41839414	rs2730819	1.0
chr7	155589968	155589969	chr7	155589968	155589969	rs1233559	1.0

awk -v OFS='\t' '{print $1, $2, $3, $7, $8}' Kunkle.example.expanded.bed > Kunkle.example.expanded.long.bed

awk -v OFS='\t' '{print $4, $5, $6, $7, $8}' Kunkle.example.expanded.bed >> Kunkle.example.expanded.long.bed

## after status
cat Kunkle.example.expanded.long.bed | head -n 2
chr12	41806259	41946923	rs2730819	1.0
chr7	155589968	155589969	rs1233559	1.0

# bedtools
## no output, when all SNPs region fall into peak regions
bedtools intersect -wa -wb -a Kunkle.example.expanded.long.bed -b peaks.bed -f 1.0

## call overlaps when not partially SNPs fall into peak regions
bedtools intersect -wa -wb -a Kunkle.example.expanded.long.bed -b peaks.bed
chr12	41806259	41946923	rs2730819	1.0	chr12	41863129	41863629
chr12	41806259	41946923	rs2730819	1.0	chr12	41866000	41866500
chr12	41806259	41946923	rs2730819	1.0	chr12	41906946	41907446
chr12	41806259	41946923	rs2730819	1.0	chr12	41907597	41908097
chr12	41806259	41946923	rs2730819	1.0	chr12	41908226	41908726
chr12	41806259	41946923	rs2730819	1.0	chr12	41906946	41907446
```
- Questions
	- 1. Reference LD SNPs, R square cutoff
	- 2. SNPs filter: p value cutoff 
	- 3. Overlap filter: -f 1.0 or not
