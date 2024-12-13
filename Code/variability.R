# measurement of RS based variability

library(imageRy)
library(terra)
library(viridis)
library(rasterdiv) # Information theory based calculus
library(lattice) # for levelplots

im.list()

sent <- im.import("sentinel.png")

# band 1 = NIR
# band 2 = red
# band 3 = green

im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=2, g=1, b=3)

nir <- sent[[1]]
plot(nir)

# moving window
# focal
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

# Exercise: calculate variability in a 7x7 pixels moving window
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
plot(sd7, col=magma(100))

# Exercise 2: plot via par(mfrow()) the 3x3 and the 7x7 standard deviation
par(mfrow=c(1,2))
plot(sd3, col=inferno(100))
plot(sd7, col=inferno(100))

# original image plus the 7x7 sd
im.plotRGB(sent, r=2, g=1, b=3)
plot(sd7)

#------ Information theory via the rasterdiv package

# Shannon
ext <- c(0, 20, 0, 20)
cropnir <- crop(nir, ext)

shan3 <- Shannon(cropnir, window=3) 
plot(shan3)

#Rényi's Index
ren <- Renyi(cropnir, window=9, alpha=seq(0,1,0.5), na.tolerance=0.2, np=1)

# Considering abundance AND distances
rao3 <- paRao(cropnir, window=3, alpha=2) # it is important that the terra package is uploaded first!
# rasterdiv::Rao() is an alias 
plot(rao3[[1]])
plot(rao3[[1]][[1]]) 

# PCA to calculate variability
sentpc <- im.pca(sent)
pc1 <- sentpc[[1]]

pc1sd <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
plot(pc1sd)
