# install.packages("ecochange")
library(ecochange)

## RasterBrick of structural Essential Biodiversity Variables
## covering the extent of a location in the northern Amazon basin
## (Colombia) is imported:
path. <- system.file('amazon.grd', package = 'ecochange')
amazon <- brick(path.)

# print available variables
names(amazon)


##### echanges: Ecosystem changes #####
?echanges
# Changes in layers of tree-canopy cover (TC) in the 'amazon' brick are computed:
def <- echanges(amazon, eco = 'TC', # eco: Regular expression matching names of a subset of layers representing the target ecosystem variables
                change = 'lossyear',
                eco_range = c(1, 80),
                get_unaffected = TRUE,
                binary_output = FALSE,
                mc.cores = 2)
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


# gaugeIndicator: compute ecosystem areas
am_areas <- gaugeIndicator(def,
                           mc.cores = 2)
plot.Indicator(am_areas)

#-------------------------------------------------------------------------------
# get country polygons with "getGADM"
# download respective remote sensing data.
# variables contain surface water, forest change, tree cover data
# for the entire list, see: listGP()
listGP()

# example Colombia
getGADM
muni <- getGADM(unit.nm = NULL,
                level = 2, country = "COL",
                path = tempdir())
head(muni)

## Polygon of the Colombian municipality of Cartagena del Chaira:
load(system.file('cchaira_roi.RData', package = 'ecochange'))
## A Global Surface Water layer ('seasonality') which covers the
## extent of the polygon is retrieved:
rsp_cchaira <- getrsp(cchaira_roi,
                      lyrs = 'seasonality', mc.cores = 2, path = tempdir())
file.exists(rsp_cchaira)

## use getWRS to download Landsat data!
wrs_cchaira <- getWRS(cchaira_roi)
plot(wrs_cchaira)
