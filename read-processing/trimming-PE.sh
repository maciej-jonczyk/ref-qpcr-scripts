# This script was used for trimming adapters from paired-end reads if needed
# Trimmomatic 0.39 was used (http://www.usadellab.org/cms/?page=trimmomatic)
# This script uses accession list downloaded from the SRA Run Selector
file=SRR_Acc_List.txt
for read in $(cat $file)
do java -jar trimmomatic-0.39.jar PE -threads `nproc --all` \
${read}_1.fastq.gz \
${read}_2.fastq.gz \
-baseout ${read}.fastq.gz ILLUMINACLIP:/home/mj/bin/Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:true MINLEN:40
done
