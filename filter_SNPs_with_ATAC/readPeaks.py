#!/usr/bin/env python

import pandas as pd
import tabix

# Specify the path to your Excel file
excel_file_path = '/Volumes/USB/mater_thesis_data/sun_processedData/SupplementalTables.combined.xlsx'
file_path="/Volumes/USB/mater_thesis_data/GWAS_catalog/"

sheet_name = 'peakName' 
excel_sheets = pd.ExcelFile(excel_file_path).sheet_names

# print(excel_sheets[8])

# for sheet_name in excel_sheets:
#     print(sheet_name)

# Read the Excel file
df = pd.read_excel(excel_file_path, excel_sheets[8])

# print(df.head)
# print(df.columns)
# print(df['peakName'].head)

df[['chr', 'start', 'end']] = df['peakName'].str.split('_', expand=True)

# df[['start', 'end']] = df[['start', 'end']].apply(pd.to_numeric)

peaks=df[['chr', 'start', 'end']]
# print(subset.head)
# Display the DataFrame
peaks.to_csv(file_path+"peaks.bed",index=False,header=False,sep='\t')
