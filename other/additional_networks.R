

set.seed(123L)

samp_greedy <- cluster_fast_greedy(as.undirected(simplify(igraph_rt_samp)))
samp_louvain <- cluster_louvain(as.undirected(simplify(igraph_rt_samp)))

samp_attr_lr$member_greedy <- samp_greedy$membership
samp_attr$member_louvain <- samp_louvain$membership

plot(simplify(igraph_rt_samp), 
     #layout = l,
     vertex.label = NA, 
     vertex.size = 4,
     vertex.color = samp.greedy$membership,
     edge.arrow.size = 0)

samp_attr_lr <- samp_attr_lr %>%
  group_by(member_greedy) %>%
  mutate(greedy_pcnt_left = 
           sum(lr=="left")/sum(!is.na(lr)),
         greedy_pcnt_right = 
           sum(lr=="right")/sum(!is.na(lr)),
         greedy_lean_right = greedy_pcnt_right - greedy_pcnt_left)

# assign colors to subgroups based on this

nclr <- 10
min <- -1 # theoretical minimum
max <- 1 # theoretical maximum
breaks <- (max - min) / nclr

plotclr <- brewer.pal(nclr, "RdBu")
plotvar <- samp_attr_lr$greedy_lean_right
class <- classIntervals(plotvar,
                        nclr,
                        style = "fixed",
                        fixedBreaks = seq(min, max, breaks))
colcode <- findColours(class, 
                       plotclr)

plot(simplify(igraph_rt_samp), 
     vertex.label = NA, 
     vertex.size = 4,
     vertex.color = colcode,
     edge.arrow.size = 0)
