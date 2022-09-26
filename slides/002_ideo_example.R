# devtools::install_github("pablobarbera/twitter_ideology/pkg/tweetscores")
library(tweetscores)
library(academictwitteR)
library(ggplot2)
library(dplyr)

get_user_id("cbarrie")
cjb_ID <- "95226101"
userfwing <- get_user_following(cjb_ID)
ids <- userfwing$id

results <- estimateIdeology("cbarrie", ids)
plot(results)