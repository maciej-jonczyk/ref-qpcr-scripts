# This script was used for rank aggregation from projects on cold stress. The procedure for aggregation of all datasets was the same.
# RobustRankAggreg package was used
# loading rankings
load("rank.cold.emtab.RDa")
load("rank.cold.gse167156.RDa")
load("rank.cold.gse167881.RDa")
load("rank.cold.prjna.RDa")
library(RobustRankAggreg)
# list of vectors with names
list.names=list(names(rank.cold.emtab),names(rank.cold.prjna),names(rank.cold.gse167156),names(rank.cold.gse167881))
# providing names to vectors
names(list.names)=c('rank.cold.emtab', 'rank.cold.prjna', 'rank.cold.gse167156', 'rank.cold.gse167881')
names(rank.cold.emtab)[1:4]
# Computation of values for 'topCutoff'
# check the number of unique genes
x=c(names(rank.cold.emtab),names(rank.cold.prjna),names(rank.cold.gse167156),names(rank.cold.gse167881))
length(x)
x2=unique(x)
N=length(x2)
# vector of cutoff values
list4topcutoff=as.vector(lapply(list.names, function(x) length(x)/N))
matrix(unlist(list4topcutoff),ncol=4)
class(matrix(unlist(list4topcutoff),ncol=4))
matrix4topcutoff=matrix(unlist(list4topcutoff),ncol=4)
vec4topcutoff=as.vector(matrix4topcutoff)
ranking.result=aggregateRanks(list.names, N = N, method = "RRA", full = FALSE, topCutoff=vec4topcutoff)
# Export of results to file
write.table(ranking.result, "RRA", quote=F, row.names=F)

