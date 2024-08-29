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

#------------------------
#------------------------
# Code Elisa Thouverai

library(sf)
library(terra)
library(tidyverse)
library(ggplot2)

#FREQUENZA AREA PER ANNO

#Carico lo stack con immagini mensili per ogni anno in una lista
fim <- list.files("...", full.names = T)
ndvi <- rast(fim)

#Dataframe per il plot
dfndvi <- as.data.frame(ndvi) %>%
  flatten_dbl() %>%
  as.data.frame() %>%
  mutate(year = rep(2000:(2000 + nlyr(r) - 1), each = ncell(r)))
colnames(dfndvi)[1] <- "ndvi"

#Plot frequenze
ggplot(dfndvi, aes(x = ndvi, y = as.factor(year), fill = stat(x))) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis_c(name = "NDVI", option = "C") 

#SERIE TEMPORALE

#Carico lo stack con immagini mensili per ogni anno in una lista
fim <- list.files("...", full.names = T)
lndvi <- lapply(fim, rast)

#Estraggo ndvi medio 
lndvi <- lapply(lndvi, function(im) {
  df <- as.data.frame(im)
  return(colMeans(df, na.rm = T))
})

#Dataframe per il plot
dfndvi <- do.call(rbind, lndvi)
dfndvi$month <- rep(1:12, each = length(lndvi))

#Plot frequenze
ggplot(dfndvi, aes(x = ndvi, y = month, fill = stat(x))) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis_c(name = "NDVI", option = "C") 



# Change the density area fill colors by groups
ggplot(iris, aes(x = Sepal.Length, y = Species)) +
  geom_density_ridges(aes(fill = Species)) +
  scale_fill_manual(values = c("dark blue", "blue", "light green")) +
  theme(legend.position = "none")
