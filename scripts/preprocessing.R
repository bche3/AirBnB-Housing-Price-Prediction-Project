library(tidyverse)

data <- read_csv("data/unprocessed/listings.csv") %>%
  # remove the 14 rows with price equal to 0 because a listing price of 0 can't be possible
  filter(price != 0) %>%
  filter(availability_365 != 0) %>%
  select(-id, -name, -host_id, -host_name, -last_review, -license)

set.seed(2022)
data <- data[sample(nrow(data), size=15000), ]

data %>% select(reviews_per_month)

data$reviews_per_month[is.na(data$reviews_per_month)] <- 0

data %>% select(reviews_per_month)
data %>% filter(is.na(reviews_per_month))
data %>% filter(reviews_per_month == 0)

# corrplot(cor(Filter(is.numeric, data), use="pairwise.complete.obs"), method = 'color', )

# include use="pairwise.complete.obs" to exclude NAs
corrplot(cor(Filter(is.numeric, data)), method = 'color', )

# drop neighbourhood, latitude, longitude,
# drop number_of_reviews_ltm and reviews_per_month for being highly correlated with number_of_reviews
data <- data %>%
  select(-neighbourhood, -latitude, -longitude, -number_of_reviews_ltm, -reviews_per_month)

corrplot(cor(Filter(is.numeric, data)), method = 'color')

glimpse(data)

# categorical variables: neighbourhood_group, room_type



