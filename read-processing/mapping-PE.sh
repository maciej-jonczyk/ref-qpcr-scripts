# Mapping of paired-end reads to maize genome version NAM-5.0
# STAR aligner version 2.7.10b was used (https://github.com/alexdobin/STAR)
# This script uses accession list downloaded from the SRA Run Selector
# This script performs also quality control of bam files using BamQC version 0.1.25_devel (https://github.com/s-andrews/BamQC)
## For non trimmed reads
mkdir raw_bamqc/
file=SRR_Acc_List.txt
for srr in $(cat $file)
  do
  ulimit -n 10000
	STAR --runThreadN 24 --readFilesIn ${srr}_1.fastq.gz ${srr}_2.fastq.gz \
--genomeDir star-index --outSAMtype BAM SortedByCoordinate --outFileNamePrefix ${srr} --readFilesCommand zcat
bamqc ${srr}Aligned.sortedByCoord.out.bam --threads 24 -f Zea_mays.Zm-B73-REFERENCE-NAM-5.0.55.chr.gtf \
-o raw_bamqc/
done
## For trimmed reads
mkdir raw_bamqc/
file=SRR_Acc_List.txt
for srr in $(cat $file)
  do
  ulimit -n 10000
	STAR --runThreadN 24 --readFilesIn ${srr}_1P.fastq.gz ${srr}_2P.fastq.gz \
--genomeDir star-index --outSAMtype BAM SortedByCoordinate --outFileNamePrefix ${srr} --readFilesCommand zcat
bamqc ${srr}Aligned.sortedByCoord.out.bam --threads 24 -f Zea_mays.Zm-B73-REFERENCE-NAM-5.0.55.chr.gtf \
-o raw_bamqc/
done
