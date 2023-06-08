library(tidyverse)
library(cowplot)

data_insurance <- read_csv("data/raw/insurance_with_date.csv")
head(data_insurance)
dim(data_insurance)

data_covid_cantons <- read_csv("data/raw/covid_cantons_2020_06.csv")
head(data_covid_cantons)
dim(data_covid_cantons)

data_ebola <- read_csv("data/raw/ebola.csv")

unique(data_covid_cantons$geoRegion）
unique(c(1,2,1))
unique(data_ebola$Country)       

usethis::use_git()
usethis::use_github()
