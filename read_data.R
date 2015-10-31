# Prep the data

library(dplyr)
library(tidyr)

budgetData <- read_excel("scary_movies.xlsx", sheet = 1) %>%
  rename(genre = movie_genre_display_name,
         budget = movie_financial_summary_production_budget) %>%
  mutate(total_gross = movie_financial_summary_domestic_box_office + 
           movie_financial_summary_international_box_office,
         multiple = total_gross / budget) %>%
  group_by(genre) %>%
  mutate(percent_by_genre = 100 * cume_dist(-multiple))
