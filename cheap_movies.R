
library(dplyr)
library(tidyr)
library(ggplot2)

source("read_data.R")

# Now let's look at the data for cheaper movies.
budgetDataCheap <- budgetData %>%
  filter(budget >= 1e6,
         budget <= 3e6) %>%
  group_by(genre) %>%
  mutate(percent_by_genre = 100 * cume_dist(-multiple)) %>%
  ungroup()

# The difference between the genres doesn't look so big now.
p <- ggplot(budgetDataCheap, aes(x = multiple, y = percent_by_genre, color = genre)) + 
  geom_line(size=2) + 
  coord_cartesian(xlim = c(1, 10), ylim = c(0, 80)) + 
  scale_color_brewer(type = "qual")
print(p)
