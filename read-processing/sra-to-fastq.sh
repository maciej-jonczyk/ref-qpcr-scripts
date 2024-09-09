# NCBI SRA Toolkit v3.1.1 was used (https://github.com/ncbi/sra-tools)
# This script uses accession list downloaded from the SRA Run Selector
# This script extracts fastq files from sra file
# Diagnostic information is saved to file
# Multithreaded pigz command is used to compress fastq files
file=SRR_Acc_List.txt
for srr in $(cat $file)
  do
	fasterq-dump --threads `nproc --all` --progress --details --split-3 $srr 2>>info-fasterq
	pigz *.fastq
done
