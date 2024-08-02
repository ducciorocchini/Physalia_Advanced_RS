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
# Open polygons
ggplot(iris, aes(x = Sepal.Length, y = Species, group = Species)) + 
  geom_density_ridges(fill = "magenta")

# Closed polygons
ggplot(iris, aes(x = Sepal.Length, y = Species, group = Species)) + 
  geom_density_ridges2(fill = "magenta")

# Changin colors
# Change the density area fill colors by groups
ggplot(iris, aes(x = Sepal.Length, y = Species)) +
  geom_density_ridges(aes(fill = Species)) +
  scale_fill_manual(values = c("dark blue", "blue", "light green")) +
  theme(legend.position = "none")
