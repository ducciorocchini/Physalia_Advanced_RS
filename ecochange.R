# Intro to the package

# install.packages("ecochange")
library(ecochange)
library(viridis)

# Original code: lk-erz

# Package paper by Wilson Lara and colleagues:
# ecochange: An R-package to derive ecosystem change indicators from freely available earth observation products
# https://doi.org/10.1111/2041-210X.13986

## RasterBrick of structural Essential Biodiversity Variables
## covering the extent of a location in the northern Amazon basin
## (Colombia) is imported:
path <- system.file('amazon.grd', package = 'ecochange')
amazon <- brick(path)
plot(amazon, col=viridis(100))

# print available variables
names(amazon)

# plotting temp
plot(amazon, 3:6, col=cividis(100))

# standardization of legends by zlim
plot(amazon, 3:6, col=cividis(100), zlim=c(0,255))

# difference
diftc = amazon[[6]] - amazon[[3]]  
plot(diftc, col=magma(100))


##### echanges: Ecosystem changes #####
?echanges
# Changes in layers of tree-canopy cover (TC) in the 'amazon' brick are computed:
# The function produces ecosystem-change maps by masking cell values in a layer of ecosystem
changes over a target set of ecosystem variables. The function also allows focusing the ecosystem-
change analysis on a species distribution range

def <- echanges(amazon,                 # Stack
                eco = 'TC',             # eco: subset of layers representing the target ecosystem variables
                change = 'lossyear')    # Name of the layer of ecosystem changes 
                  
# Method 'plot.echanges' allows comparing rasters using a common scale bar:
plot.echanges(def, main="Changes in tree canopy cover [%]", 
                labels=c("2000", "2005", "2010", "2015"))

##### EBVstats: compute ecosystem statistics #####
st_amazon <- EBVstats(def)
plot.EBVstats(st_amazon,
              cex = 1.5,
              xlab = 'Year',
              ylab = 'Canopy cover (%)',
              main = 'Ecosystem changes',
              sub = 'Northern Amazon',
              fill = 'Layer')

