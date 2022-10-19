library(dplyr)
library(multiplex)

g <- read.gml("data/assignment/polblogs/polblogs.gml")

g <- g[,-c(3,4)]

colnames(g) <- c("sourcepage", "linkedpage")

saveRDS(g, "data/assignment/polblogs.rds")

