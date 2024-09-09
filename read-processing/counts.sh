# This script summarizes reads and produce counts
# featureCounts program version 2.0.6 was used (https://subread.sourceforge.net/featureCounts.html)
# -s option was set according to type of library
## For paired-end data
featureCounts -C  -B  -Q 10  -F GTF  -s 0 -T 24  \
--ignoreDup -p --countReadPairs  -t exon  -g gene_id  \
-a Zea_mays.Zm-B73-REFERENCE-NAM-5.0.55.chr.gtf \
-o counts.txt  \
`ls *.bam`
## For single-end data
featureCounts -C  -B  -Q 10  -F GTF  -s 0 -T 24  \
--ignoreDup  -t exon  -g gene_id  \
-a Zea_mays.Zm-B73-REFERENCE-NAM-5.0.55.chr.gtf \
-o counts.txt  \
`ls *.bam`

