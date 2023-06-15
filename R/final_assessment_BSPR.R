library(ggplot2)
library(dplyr)
library(tidyverse)
library(unibeCols)
library(medicaldata)


expression_gpx4 <- read_csv("data/raw/GPX4_Expression_Public_23Q2.csv")

  
head(expression_gpx4,10)



# ggplot to create line plot #
line_GPX4 <- ggplot(data = expression_gpx4,
                      mapping = aes(x = expression_gpx4$`Cell Line Name`, y = expression_gpx4$`Expression Public 23Q2`, 
                                    fill = expression_gpx4$Lineage, colour = expression_gpx4$Lineage)) + 
  geom_col( alpha = 0.7, linetype = "solid", 
            linewidth = 1.5,position = "stack", width = 0.7) + 
  ggtitle(label = "GPX4 expression in cell lines") +
  xlab(label = "cell line") +
  ylab(label = "Relative expression level")
line_GPX4