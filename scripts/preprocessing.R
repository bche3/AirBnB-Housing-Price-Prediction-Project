library(tidyverse)

data <- read_csv("data/unprocessed/listings.csv") %>%

glimpse(data)

data <-data %>%

colSums(is.na(is.numeric(data[,nums])))

glimpse(data)

nums <- unlist(lapply(data, is.numeric), use.names = FALSE)  
nums

  
which(is.na(data), arr.ind=TRUE)  
  
data %>%
  filter(price==0)
data

test <- subset(data, price > 0)
test
glimpse(data)

set.seed(2022)
rand_df <- data[sample(nrow(data), size=10000), ]


