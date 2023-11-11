import tabix
import pandas as pd
import pdb
import argparse

def parse_args():
    parser=argparse.ArgumentParser(description="LD expand all SNPs in a given file set")

    # original GWAS stage1 file after processing into bed format
    parser.add_argument("--snp_pos_bed_file")

    # linkage equilibrium file
    parser.add_argument("--LD_file",default="/Users/shaotingting/Library/CloudStorage/OneDrive-Personal/tingtingshao/masterThesis/data/GWAS_catalog/EUR_geno.txt.gz")
    
    parser.add_argument("--outf")
    return parser.parse_args()

def main():
    args=parse_args()

    # read LD file
    ld_data=tabix.open(args.LD_file)
    print("opened tabixed LD file for reading")

    # read SNPs file
    snps=pd.read_csv(args.snp_pos_bed_file,header=None,sep='\t')
    outf=open(args.outf,'w')

    for index,row in snps.iterrows():

        # to keep track of the running process
        if index %100000==0:
            print(index)

        # convert a row as a single string
        row_string='\t'.join([str(i) for i in row])
        # print(row_string)
        try:       
            # print(row[2])   
            # print(row)  
            ld_snps=ld_data.query(row[0],row[1],row[2])
            # print(row[0])
            # print(ld_snps)
            #get the min and max position of the overlap
            ld_snps=[i for i in ld_snps]
            # print(ld_snps[1])
            # print(ld_snps[2])
            
            # print(ld_snps[0][0])
            # print(ld_snps[0][1])
            # print(ld_snps[1][0])
            # print(ld_snps[2][0])
            # print(ld_snps[3][0])
            # print(ld_snps[-1][0])
            # print(ld_snps[0][1])
            # print(len(ld_snps))
            # print(ld_snps[:10])
            if len(ld_snps)==0:
                # print(len(ld_snps))
                #nothing in ld found, just use the original snp entry 
                # print('\t'.join([str(i) for i in row[0:3]])+'\t'+row_string+'\n')
                outf.write('\t'.join([str(i) for i in row[0:3]])+'\t'+row_string+'\n')
            else:
                min_pos=ld_snps[0][5]
                print(min_pos)
                max_pos=ld_snps[-1][5]
                if min_pos>=max_pos:
                    outf.write('\t'.join([str(i) for i in row[0:3]])+'\t'+row_string+'\n')
                    continue 
                chrom=ld_snps[0][4]
                snp=row[3]
                outf.write('\t'.join([chrom,min_pos,max_pos])+'\t'+row_string+'\n')
        except:
            #query failed
            outf.write('\t'.join([str(i) for i in row[0:3]])+'\t'+row_string+'\n')
if __name__=="__main__":
    main()
    
