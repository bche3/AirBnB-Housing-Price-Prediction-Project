library(tidyverse)

data <- read_csv("data/unprocessed/listings.csv") %>%
  # remove the 14 rows with price equal to 0 because a listing price of 0 can't be possible
  filter(price != 0) %>%
  filter(availability_365 != 0) %>%
  select(-id, -name, -host_id, -host_name, -last_review, -license)

data <- read_csv("data/unprocessed/listings.csv") %>%
  # remove the 14 rows with price equal to 0 because a listing price of 0 can't be possible
  filter(price != 0) %>%
  filter(availability_365 != 0) %>%
  select(-id, -name, -host_id, -host_name, -last_review, -license, -neighbourhood, -latitude, -longitude, -number_of_reviews_ltm, -reviews_per_month)

data

# AFTER EDA
# drop neighbourhood, latitude, longitude,
# drop number_of_reviews_ltm and reviews_per_month for being highly correlated with number_of_reviews
data
glimpse(data)


set.seed(2022)
rand_df <- data[sample(nrow(data), size=10000), ]


