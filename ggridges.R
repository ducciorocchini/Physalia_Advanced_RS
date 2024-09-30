# Code Elisa Thouverai 

library(sf)
library(terra)
library(tidyverse)
library(ggplot2)
library(imageRy)
library(ggridges)

r <- im.import("greenland")

df <- as.data.frame(r) 

dfpl <- df %>%
  flatten_dbl() %>%
  as.data.frame() %>%
  mutate(year = rep(names(r), each = nrow(df)))

colnames(dfpl)[1] <- "value"

ggplot(dfpl, aes(x = value, y = as.factor(year), fill = stat(x))) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis_c(option = "C") 

ggplot(dfpl, aes(x = value, y = as.factor(year), fill = stat(x))) + 
  xlim(12500,15500)+ # choose the maximum
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis_c(option = "viridis", direction=-1)  # reverse palette

