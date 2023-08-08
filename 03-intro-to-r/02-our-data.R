# Load libraries
library(tidyverse)

# Data source
# https://www.kaggle.com/datasets/arushchillar/disneyland-reviews?resource=download

# Load data
df <- read_csv("DisneylandReviews.csv")

# Look at the structure of the data
str(df)

# Using dplyr's `glimpse` function
glimpse(df)

# Look at the first n rows
head(df)

# Look at the last n rows
tail(df)

# Look at just the head of the location column
head(df$Reviewer_Location)

# What parks have been reviewed
unique(df$Branch)

# Let's drop "Disneyland_" from the start of the park names for clarity and
# rename that column to "Park"
df <- df %>% 
  mutate(Branch = case_match(Branch, 
                             "Disneyland_California" ~ "California",
                             "Disneyland_HongKong" ~ "Hong Kong",
                             "Disneyland_Paris" ~ "Paris")) |> 
  rename("Park" = Branch)

# Look at the final data set
glimpse(df)
