# This script normalizes count data and ranks genes according to variance
# This code was run for each project
# In case of projects on multiple stresses separe analysis for cold + control and entire dataset was done
# DESeq2 package is used
library(DESeq2)
# read counts
cts <- as.matrix(read.table("counts4r", sep="\t", header=T, row.names="Geneid"))
# read sample info
coldata=read.table("samples4r", sep="\t", header=T, row.names=1)
# check if order of samples in both files is consistent
all(rownames(coldata) == colnames(cts))
# 'group' is a concatenate of 'line' and 'condition' variables
# code 'group' variable as factor
coldata$group <- factor(coldata$group)
# DESeq dataset with simple one-factor model
dds=DESeqDataSetFromMatrix(countData=cts, colData=coldata, design= ~ group)
# keep only genes with at least 10 counts in each sample
keep <- rowSums(counts(dds) >= 10) == dim(dds)[2]
dds.f <- dds[keep,]
dim(dds.f)
# VST normalization, command work on full data (as opposed to 'vst')
# turning-off blind estimation is advised by package developer
vsd <- varianceStabilizingTransformation(dds.f, blind = FALSE)
## Filtering
# using both automatic quantile and sample number computation
keep <- rowSums(assay(vsd) >= quantile(assay(vsd), probs=.25)) >= dim(dds)[2]
vsd.f <- vsd[keep,]
dim(vsd.f)
# extract only count table
counts.vst=assay(vsd.f)
# calculate variance
counts.vst.var=apply(counts.vst, 1, var)
# sort to get ranking
counts.vst.var.srt=sort(counts.vst.var)
# see six best genes
counts.vst.var.srt[1:6]

# Renaming and saving for joint analysis
rank.cold.PROJECTID=counts.vst.var.srt
save(rank.cold.PROJECTID, file='rank.cold.PROJECTID.RDa')
