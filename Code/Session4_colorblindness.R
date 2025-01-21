# Code for colorblindness check and solving

# Simulation of color blindness

############### NDVI perception

# Local data: ~/Downloads/sent_cblind/S2A_MSIL2A_20230821T100601_N0509_R022_T32TQS_20230821T163000.SAFE/GRANULE/L2A_T32TQS_A042633_20230821T101414/IMG_DATA/R10m

# Idea for a figure:
# Something simple like an image of a small area – perhaps showing NDVI or temperature? There are many standard visualization colour bars used and the image would look different in each. So for NDVI or thermal could have grey scale, blue-red, brown-green etc etc. Such a simple visualisation might help

library(imageRy)
library(terra)

im.list()
sentdol <- im.import("sentinel.dolomites.")

ndvi <- im.ndvi(sentdol, 4, 3)
plot(ndvi)

# grey scale, blue-red, brown-green etc etc.
clgr <- colorRampPalette(c("black","dark grey","light grey"))(100)
clbr <- colorRampPalette(c("blue","white","red"))(100)
clbg <- colorRampPalette(c("brown","yellow","green"))(100)

par(mfrow=c(1,3))
plot(ndvi, col=clgr)
plot(ndvi, col=clbr)
plot(ndvi, col=clbg)

############### Color vision simulation

par(mfrow=c(1,2))

# Palettes 
# Colors in R: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
palraw <- colorRampPalette(c("red", "orange", "red", "chartreuse", "cyan",
                             "blue"))(100)
palraw_grey <- colorRampPalette(c("dark orange", "orange", "grey", "dark grey",
                                  "light grey", "blue"))(100)

# Plot
plot(ndvi, col=palraw)
plot(ndvi, col=palraw_grey)

# Vinicunca
# https://fb.watch/xfBsEdtO4Z/
setwd("~/Desktop/")
vinicunca <- rast("vinicunca.jpg")

plot(vinicunca)

par(mfrow=c(1,2))
im.plotRGB(vinicunca, 1,2,3, title="Standard vision")
im.plotRGB(vinicunca, 2,2,3, title="Protanopia")

# palraw_grey <- colorRampPalette(c("light blue", "darkgoldenrod", "dark grey",
                                    "white", "light blue"))(100)
# plot(vinicunca[[1]], col=palraw_grey)

# Check for color blindness

# install.packages("colorblindcheck")
library(devtools)
# devtools::install_github("clauswilke/colorblindr")
# devtools::install_github("ducciorocchini/cblindplot")
library(colorblindcheck)
library(colorblindr)
library(cblindplot)
library(ggplot2)
library(patchwork)
library(imageRy)
library(terra)

## colorblindcheck

rainbow_pal <- rainbow(7)
palette_check(rainbow_pal, plot=TRUE)

rainbow_pal <- rainbow(100)
palette_check(rainbow_pal, plot=TRUE)

## colorblindr

# install_github("colorblindr")

explot <- ggplot(iris, aes(Sepal.Length, fill=Species)) +
geom_density(alpha=0.7)
explot 

colorblindr::cvd_grid(explot)

explot2 <- ggplot(iris, aes(Sepal.Length, fill = Species)) + 
  geom_density(alpha=0.7) + scale_fill_OkabeIto()
explot2

explot + explot2

## cblindplot
# Search the network for a rainbow color map typing e.g. 
# rainbow color map climate
setwd("~/Downloads/")
rainbow <- rast("rainbow.jpg")
# rainbowinput = "rainbow.png"
cblind.plot(rainbow, cvd= "protanopia")
