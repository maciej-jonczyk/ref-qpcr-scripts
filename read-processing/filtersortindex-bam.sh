# Quality-filtering, sorting and indexing of bam files
# samtools version 1.17 was used (https://github.com/samtools/samtools)
# This script uses accession list downloaded from the SRA Run Selector

mkdir q10-srt-idx

file=SRR_Acc_List.txt
for srr in $(cat $file)
  do
samtools view -@24 -bq10 ${srr}Aligned.sortedByCoord.out.bam -o ${srr}q10.bam && samtools sort -@24 \
-o ${srr}q10srt.bam ${srr}q10.bam && samtools index -@24 ${srr}q10srt.bam \
&& rm ${srr}q10.bam
done
