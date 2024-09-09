# This script removes reads from bad tiles
# This script was used only for files with serious problems with 'Per tile sequence quality' module from FastQC.
# The first step is to change sequence names from SRA to standard format
# Filtering was done with filterbytile.sh command form the bbmap suite version 39.01 (https://jgi.doe.gov/data-and-tools/software-tools/bbtools/bb-tools-user-guide/bbmap-guide/)
# Aggressive filtering was applied
file=ListOfFilesWithBadTiles # list of SRA accessions
for srr in $(cat $file)
do
zcat ${srr}.fastq.gz | sed -r 's/^@SRR[0-9]{7}\.[0-9]* /@/' | sed '/@/s/ length.*$/ 1:/' | pigz > ${srr}repair.fastq.gz
filterbytile.sh in=${srr}repair.fastq.gz out=${srr}asive.fastq.gz ud=0.75 qd=1 ed=1 ua=.5 qa=.5 ea=.5 overwrite=true
done
