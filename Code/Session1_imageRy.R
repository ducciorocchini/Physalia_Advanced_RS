# Main functions of the imageRy package

# DATA VISUALISATION

# Code for remote sensing data handling and analysis

# install.packages("devtools")
# install_github("ducciorocchini/imageRy")

library(terra)
library(imageRy)

# Listing data inside imageRy
im.list()

# Sentinel-2 bands
# https://gisgeography.com/sentinel-2-bands-combinations/

# importing the data
b2 <- im.import("sentinel.dolomites.b2.tif")

cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(b2, col=cl)

# Exercise: import b3 and plot it with the previous palette
b3 <- im.import("sentinel.dolomites.b3.tif")
plot(b3, col=cl)

# Importing the red band
b4 <- im.import("sentinel.dolomites.b4.tif")
plot(b4, col=cl)

# Importing the NIR band
b8 <- im.import("sentinel.dolomites.b8.tif")
plot(b8, col=cl)

# Multiframe
par(mfrow=c(2,2))
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

# stack
sentstack <- c(b2, b3, b4, b8)
plot(sentstack, col=cl)

# Plotting one layer
dev.off()
plot(sentstack[[1]], col=cl)
plot(sentstack[[4]], col=cl)

# Multiframe with different color palette
par(mfrow=c(2,2))

clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(b2, col=clb)

# Exercise: apply the same concept to the green band (b3)
clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(b3, col=clg)

# Plotting red band (b4)
clr <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(b4, col=clr)

# Plotting the NIR band (b8)
cln <- colorRampPalette(c("brown", "orange", "yellow")) (100)
plot(b8, col=cln)

# RGB plotting
# sentstack[[1]] blue
# sentstack[[2]] green
# sentstack[[3]] red
# sentstack[[4]] NIR
  
dev.off()
im.plotRGB(sentstack, r=3, g=2, b=1) # natural color image
im.plotRGB(sentstack, r=4, g=3, b=2) # false color image
im.plotRGB(sentstack, r=3, g=4, b=2) # false color image
im.plotRGB(sentstack, r=3, g=2, b=4) # false color image

# SPECTRAL INDICES

# Listing files
im.list()

# Importing data
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# band 1 = NIR
# band 2 = red
# band 3 = green

im.plotRGB(m2006, r=1, g=2, b=3)
im.plotRGB(m2006, r=3, g=2, b=1)
im.plotRGB(m2006, r=3, g=1, b=2)

# Ancient data
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
im.plotRGB(m1992, r=1, g=2, b=3)

par(mfrow=c(1,2))
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m2006, r=1, g=2, b=3)

# Exercise: make a multiframe with 6 images in pairs with nir on the same component

# first row: m1992 and m2006 with r=1
# second row: m1992 and m2006 with g=1
# third row: m1992 and m2006 with b=1
# 3 rows per 2 columns

par(mfrow=c(3,2))
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m2006, r=1, g=2, b=3)

im.plotRGB(m1992, r=2, g=1, b=3)
im.plotRGB(m2006, r=2, g=1, b=3)

im.plotRGB(m1992, r=3, g=2, b=1)
im.plotRGB(m2006, r=3, g=2, b=1)

# Difference vegetation index in 1992
dvi1992 = m1992[[1]] - m1992[[2]]

dev.off()
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)
plot(dvi1992, col=cl)

# Difference vegetation index in 1992
dvi2006 = m2006[[1]] - m2006[[2]]
plot(dvi2006, col=cl)

par(mfrow=c(1,2))
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)

# ndvi
ndvi1992 = dvi1992 / (m1992[[1]] + m1992[[2]])
ndvi2006 = dvi2006 / (m2006[[1]] + m2006[[2]])

plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

plot(ndvi1992)
plot(ndvi2006)

# CLASSIFICATION

# Classification process in R using imageRy

library(ggplot2)
install.packages("patchwork")
library(patchwork)

im.list()

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

sunc <- im.classify(sun, num_clusters=3)

#--- Mato Grosso example

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

m1992c <- im.classify(m1992, num_clusters=2)
# class 1 = human related areas and water
# class 2 = forest
x <- subst(sentc, c(1,2), c("forest","other"))

m2006c <- im.classify(m2006, num_clusters=2)
# class 1 = forest
# class 2 = human related areas and water

# frequencies
f1992 <- freq(m1992c)
tot1992 <- ncell(m1992c)

p1992 = f1992 * 100 / tot1992
# class 1 = human related areas and water = 17
# class 2 = forest = 83

f2006 <- freq(m2006c)
tot2006 <- ncell(m2006c)

p2006 = f2006 * 100 / tot2006
# class 1 = forest = 45
# class 2 = human related areas and water = 55

# building a dataframe
class <- c("Forest","Human")
y1992 <- c(83, 17)
y2006 <- c(45, 55)

tabout <- data.frame(class, y1992, y2006)
tabout

# final graph
p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1  + p2
p1 / p2

# Code for importing remote sensing data from outside R

library(terra)

# Setting the working directory
setwd("~/Downloads")

# Windowds: "C:\\path\Downloads" -> "C://path/Downloads"

getwd()

cal <- rast("altadenaeatonwide_aviris_20250111_lrg.jpg")
plot(cal)

# Analysing he uploaded data
# Original coord: 0, 1440, 0, 600  (xmin, xmax, ymin, ymax)
ext <- c(100, 1000, 100, 500)
calcrop <- crop(cal, ext)
plot(calcrop)

# Exporting data
writeRaster(calcrop, "calcrop.png")

# Exercise: download a set of the Earth Observatory and upload it in R
sun <- rast("Sun_STEREO_4dec2006_lrg.jpg")
sun
plot(sun)

# extent      : 0, 1800, 0, 1800  (xmin, xmax, ymin, ymax)
# cropping the data
ext <- c(100, 1000, 100, 1000)
suncrop <- crop(sun, ext)
plot(suncrop)

writeRaster(suncrop, "suncrop.png")

# In case you are seeing rotated images, look here:
# https://gis.stackexchange.com/questions/259321/opening-rotated-raster-in-r
# or make use of the flip() function of the terra package
# e.g. 
# calf <- flip(cal)








