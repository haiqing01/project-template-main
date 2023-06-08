
# density plot line#
insurance <- read_csv("data/raw/insurance_with_date.csv")
insurance <- insurance %>% mutate(children = as.factor(children))

head(insurance)

dim(insurance)

plot_density_v1 <- ggplot( insurance , aes(x = bmi, colour = sex, fill = sex ) ) + 
  geom_density( alpha = 0.4 ) +
  theme(text = element_text(size=20), legend.position = "bottom") +
  xlab( expression(paste( "BMI (kg/", m^2,")")) ) + 
  scale_colour_manual(name = "" , values=c("female"=unibePastelS()[1],
                                           "male"=unibeIceS()[1]), labels = c("Female", "Male")) +
  scale_fill_manual(name = "", values=c("female"=unibePastelS()[1],
                                        "male"=unibeIceS()[1]), labels = c("Female", "Male")) 
plot_density_v1

# density plot column #
plot_density_v2 <- ggplot( insurance ) + 
  geom_histogram( aes(x = charges, y = after_stat(density), colour = sex, fill = sex ),
                  alpha = 0.4, bins = 100 ) +
  geom_density( aes(x = charges, colour = sex), linewidth = 1.5 ) +
  theme(text = element_text(size=20), legend.position = "top") +
  xlab( "Charges in Dollar" ) + 
  scale_colour_manual(name = "" , values=c("female"=unibePastelS()[1],
                                           "male"=unibeIceS()[1]), labels = c("Female", "Male")) +
  scale_fill_manual(name = "", values=c("female"=unibePastelS()[1],
                                        "male"=unibeIceS()[1]), labels = c("Female", "Male")) +
  geom_vline(aes(xintercept = median(charges)), color = unibeRedS()[1], linewidth = 1)
plot_density_v2

# quantiles #
library(quantreg)
plot_density_v3 <- ggplot( insurance , aes(x = age, y = bmi, color =smoker) ) + 
  geom_point(  ) +
  geom_quantile(  ) +
  theme(text = element_text(size=20), legend.position = "top") +
  xlab( "Age (years)" ) + ylab( expression(paste( "BMI (kg/", m^2,")")) ) + 
  scale_colour_manual(name = "" , values=c("no"=unibeRedS()[1],
                                           "yes"=unibeIceS()[1]), labels = c("No", "Yes")) +
  scale_fill_manual(name = "" , values=c("no"=unibeRedS()[1],
                                         "yes"=unibeIceS()[1]), labels = c("No", "Yes")) 
plot_density_v3

# violin plot #
violin_plot <- ggplot( insurance , aes(x = smoker, y = charges ) ) + 
  ylab( "Charges ($)" ) +
  geom_violin(  )
violin_plot

# box plot #
box_plot <- ggplot( insurance , aes(x = smoker, y = charges ) ) + 
  geom_boxplot(  ) + 
  ylab( "Charges ($)" ) + 
  coord_flip()
box_plot


# grid #
library(cowplot)

plot_ebola_point_grid <- plot_grid(plotlist = list(plot_density_v1, plot_density_v2, plot_density_v3, 
                                                   violin_plot, box_plot),
                                   labels = c("V1", "V2", "V3", "V4", "V5"), label_size = 12, nrow = 2)

plot_ebola_point_grid
