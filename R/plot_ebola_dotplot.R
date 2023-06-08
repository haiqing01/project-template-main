#  ggplots visualization  #
library(ggplot2)
library(dplyr)
library(tidyverse)
data_ebola <- read_csv("data/raw/ebola.csv")

data_ebola <- arrange(data_ebola, Date)

head(data_ebola)

dim(data_ebola)

data_ebola_cum_cases <- data_ebola %>%
  select(date = Date, country = Country, Cum_conf_cases = Cum_conf_cases) %>%
  filter(date <= as.Date("2015-05-31") &
           (country=="Guinea" | country=="Liberia" | country=="Sierra Leone"))

# dot plot #
plot_ebola_point_v0 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = Cum_conf_cases)) + 
  geom_point()
plot_ebola_point_v0

# color dotplot #
plot_ebola_point_v1 <- ggplot(data = data_ebola_cum_cases, 
                        mapping = aes(x = date, y = Cum_conf_cases, colour = country, 
                                      fill = country, group_by = country)) + 
  geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
  geom_line(color="red")
plot_ebola_point_v1

# label color dotplot #
plot_ebola_point_v2 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = Cum_conf_cases, fill = country, colour = country)) + 
  geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
  ggtitle(label = "Cum_conf_cases in 3 country") +
  xlab(label = "Date") +
  ylab(label = "Cum_conf_cases")
plot_ebola_point_v2

# change standard colors #
library("unibeCols")

plot_ebola_point_v3 <- ggplot(data = data_ebola_cum_cases, 
                                 mapping = aes(x = date, y = Cum_conf_cases, fill = country, colour = country)) + 
  geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeMustardS()[1], unibeIceS()[1]),
                    labels = c("Guinea", "Liberia", "Sierra Leone")) +
  scale_colour_manual(name = "country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeMustardS()[1], unibeIceS()[1]),
                      labels = c("Guinea", "Liberia", "Sierra Leone")) +
  ggtitle(label = "Cum_conf_cases in 3 country") +
  xlab(label = "Date") +
  ylab(label = "Cum_conf_cases")
plot_ebola_point_v3

# change scale #
plot_ebola_point_v4 <- ggplot(data = data_ebola_cum_cases, 
                                 mapping = aes(x = date, y = Cum_conf_cases, fill = country, colour = country)) + 
  geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeMustardS()[1], unibeIceS()[1]),
                    labels = c("Guinea", "Liberia", "Sierra Leone")) +
  scale_colour_manual(name = "country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeMustardS()[1], unibeIceS()[1]),
                      labels = c("Guinea", "Liberia", "Sierra Leone")) +
  scale_x_date(breaks = as.Date(c("2014-08-29", "2014-10-01", "2014-12-01", 
                                  "2015-02-01","2015-04-01","2015-06-01")),
               labels = c("29 Feb 2014", "1 Oct 2014", "1 Dec 2014", "1 Feb 2015", "1 Apr 2015","1 Jun 2015"),
               limits = as.Date(c("2014-08-29", "2015-06-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 9000, by = 3000),
                     limits = c(0, 9000)) +
  ggtitle(label = "Cum_conf_cases in 3 country") +
  xlab(label = "Date") +
  ylab(label = "Cum_conf_cases")
plot_ebola_point_v4

# change theme #
plot_ebola_point_v5 <- ggplot(data = data_ebola_cum_cases, 
                                 mapping = aes(x = date, y = Cum_conf_cases, fill = country, colour = country)) + 
  geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeMustardS()[1], unibeIceS()[1]),
                    labels = c("Guinea", "Liberia", "Sierra Leone")) +
  scale_colour_manual(name = "country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeMustardS()[1], unibeIceS()[1]),
                      labels = c("Guinea", "Liberia", "Sierra Leone")) +
  scale_x_date(breaks = as.Date(c("2014-08-29", "2014-10-01", "2014-12-01", 
                                  "2015-02-01","2015-04-01","2015-06-01")),
               labels = c("29 Feb 2014", "1 Oct 2014", "1 Dec 2014", "1 Feb 2015", "1 Apr 2015","1 Jun 2015"),
               limits = as.Date(c("2014-08-29", "2015-06-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 9000, by = 3000),
                     limits = c(0, 9000)) +
  ggtitle(label = "Cum_conf_cases in 3 country") +
  xlab(label = "Date") +
  ylab(label = "Cum_conf_cases")+
  # cahnge theme #
  theme_bw() + theme(legend.position="bottom")

# grid #
library(cowplot)

plot_ebola_point_grid <- plot_grid(plotlist = list(plot_ebola_point_v0, plot_ebola_point_v1, plot_ebola_point_v2, 
                                                   plot_ebola_point_v3, plot_ebola_point_v4, plot_ebola_point_v5),
                                   labels = c("V1", "V2", "V3", "V4", "V5", "V6"), label_size = 12, nrow = 2)

plot_ebola_point_grid



# facet #
plot_ebola_point_v6 <- ggplot(data = data_ebola_cum_cases, 
                                 mapping = aes(x = date, y = Cum_conf_cases, fill = country, colour = country)) + 
  geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeMustardS()[1], unibeIceS()[1]),
                    labels = c("Guinea", "Liberia", "Sierra Leone")) +
  scale_colour_manual(name = "country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeMustardS()[1], unibeIceS()[1]),
                      labels = c("Guinea", "Liberia", "Sierra Leone")) +
  scale_x_date(breaks = as.Date(c("2014-08-29", "2014-10-01", "2014-12-01", 
                                  "2015-02-01","2015-04-01","2015-06-01")),
               labels = c("29 Feb 2014", "1 Oct 2014", "1 Dec 2014", "1 Feb 2015", "1 Apr 2015","1 Jun 2015"),
               limits = as.Date(c("2014-08-29", "2015-06-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 9000, by = 3000),
                     limits = c(0, 9000)) +
  ggtitle(label = "Cum_conf_cases in 3 country") +
  xlab(label = "Date") +
  ylab(label = "Cum_conf_cases")+
  # cahnge theme #
  theme_bw() + theme(legend.position="bottom")+
  # change facet #
  facet_grid(cols = vars(country))
plot_ebola_point_v6





Sys.setlocale("LC_TIME","EN")
