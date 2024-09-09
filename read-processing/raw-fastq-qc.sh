# Quality control of raw fastq files
# FastQC v0.12.1 was used (https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
# In the same way fastq files after trimming was checked

mkdir raw_qc/ # directory for results
ls *.fastq.gz > fastqlist # list of fastq files

file=fastqlist
for reads in $(cat $file)
  do
	fastqc $reads --outdir raw_qc/
done
