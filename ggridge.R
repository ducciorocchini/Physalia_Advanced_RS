# ggridges: Ridgeline Plots in 'ggplot2'

# install.packages("ggridges")
packagelist <- c("ggridges", "ggplot2")
lapply(packagelist, require) #check!

library(ggridges)
library(ggplot2)
library(terra)
library(imageRy)
library(dplyr) # for data.frame selection

# temperature variations
ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = Month, fill = stat(x))) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis_c(name = "Temp. [F]", option = "C") +
  labs(title = 'Temperatures in Lincoln NE in 2016')

# super!

#----

