# Formatting count file for analysis in R
# It leaves only gene IDs in rows and samples in columns
export LC_ALL=C
tail -n +2 counts.txt > x
cut --complement -f2-6 -d"	" x > x2
sed '/Geneid/s/q10srt.bam//g' x2 > counts4r

