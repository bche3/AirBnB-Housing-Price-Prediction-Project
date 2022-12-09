library(tidyverse)

data <- read_csv("data/unprocessed/listings.csv") 

glimpse(data)

set.seed(2022)
subset <- sample(data, 1500)
glimpse(subse