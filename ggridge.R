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

# raster data making use of imageRy
im.list()   # listing data

# stack EN
EN_01 <- im.import("EN_01.png")
EN_05 <- im.import("EN_05.png")
EN_10 <- im.import("EN_10.png")
EN_13 <- im.import("EN_13.png")

EN <- c(EN_01[[1]], EN_05[[1]], EN_10[[1]], EN_13[[1]])

ENd <- as.data.frame(EN, xy=TRUE)

head(ENd)

ENds <- ENd %>%
  dplyr::select(EN_01_1, EN_05_1, EN_10_1, EN_13_1)

# or, without pipe %>%:
ENds <- dplyr::select(df1, A, B, E)

ggplot(ENds) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis_c(name = "NO2", option = "C") +
  labs(title = 'NO2 variation')



df_montesole <- terra::extract(montesole, foreste, df = TRUE)


df_montesole %>%
  ggplot(aes(y = Species)) +
  geom_density_ridges(aes(x = Blue, fill = Management),
                      alpha = 0.8, color = "white") +
  labs(x = "Blue band reflectance",
       y = "Main species",
       title = "Blue band reflectance conditional on main species and forest management") +
  scale_x_continuous(expand = c(0, 0), limits = c(0, 150)) +
  scale_y_discrete(expand = expansion(mult = c(0.01, 0.25))) +
  coord_cartesian(clip = "off") +
  scale_fill_viridis_d(option = "mako") +
  theme_ridges(grid = T)

