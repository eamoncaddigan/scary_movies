# Just redoing Walt Hickey's original analysis. 

library(readxl)
library(dplyr)
library(ggplot2)

source("read_data.R")

p <- ggplot(budgetData, aes(x = multiple, y = percent_by_genre, color = genre)) + 
  geom_line(size=2) + 
  xlim(1, 10) + ylim(0, 80) + scale_color_brewer(type = "qual")
print(p)
