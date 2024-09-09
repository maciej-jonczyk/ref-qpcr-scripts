# NCBI SRA Toolkit v3.1.1 was used (https://github.com/ncbi/sra-tools)
# This script uses accession list downloaded from the SRA Run Selector
# SRA files are validated and diagnostic information is saved to files
file=SRR_Acc_List.txt
for srr in $(cat $file)
  do
  prefetch $srr -C yes --progress --verbose >>info-prefetch
  vdb-validate $srr 2>>info-validate
done
