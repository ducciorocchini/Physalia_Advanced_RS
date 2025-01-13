library(terra)
library(imageRy)
library(viridis)

im.list()

ndvi <- im.import("Sentinel2_NDVI")

names(ndvi) <- c("02", "05", "08", "11")

im.ridgeline(ndvi, 2, "viridis") 
