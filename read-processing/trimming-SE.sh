# This script was used for trimming single-end reads if needed
# Trimmomatic 0.39 was used (http://www.usadellab.org/cms/?page=trimmomatic)
# This script uses accession list downloaded from the SRA Run Selector
## If both adapter and quality trimming is needed
file=SRR_Acc_List.txt
for read in $(cat $file)
do java -jar trimmomatic-0.39.jar SE -threads `nproc --all` \
$read.fastq $read-trim.fastq ILLUMINACLIP:/home/mj/bin/Trimmomatic-0.39/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:40
done
## If only adapter trimming is needed
file=SRR_Acc_List.txt
for read in $(cat $file)
do java -jar trimmomatic-0.39.jar SE -threads `nproc --all` \
$read.fastq $read-trim.fastq ILLUMINACLIP:/home/mj/bin/Trimmomatic-0.39/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 MINLEN:40
done
