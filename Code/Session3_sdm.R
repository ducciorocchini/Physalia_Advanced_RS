# Species Distribution Modelling

# install.packages("sdm")
# install.packages("rgdal", dependencies=T)
# install.packages("viridis")

library(sdm)
library(raster) # predictors
# library(rgdal) # species
library(viridis)

file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file)

# looking at the set
species

# plot
plot(species)

# looking at the occurrences
species$Occurrence

# copy and then write:
plot(species[species$Occurrence == 1,],col='blue',pch=16)
points(species[species$Occurrence == 0,],col='red',pch=16)

# predictors: look at the path
path <- system.file("external", package="sdm") 

# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

# stack
preds <- stack(lst)

# plot preds
plot(preds, col=viridis(100))

# plot predictors and occurrences
plot(preds$elevation, col=viridis(100))
points(species[species$Occurrence == 1,], pch=16)

plot(preds$temperature, col=viridis(100))
points(species[species$Occurrence == 1,], pch=16)

plot(preds$precipitation, col=viridis(100))
points(species[species$Occurrence == 1,], pch=16)

plot(preds$vegetation, col=viridis(100))
points(species[species$Occurrence == 1,], pch=16)

# model

# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds)

# model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# make the raster output layer
p1 <- predict(m1, newdata=preds) 

# plot the output
plot(p1, col=viridis(100))
points(species[species$Occurrence == 1,], pch=16)

