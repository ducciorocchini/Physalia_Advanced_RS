# Original code: lk-erz

library(geodata)


#-------------------------------------------------------------------------------
##### MAPS #####
# store data in current dir
gadm(country="ITA", version="latest", level=1, resolution=1, path=getwd())
ita <- readRDS("gadm/gadm41_ITA_1_pk.rds")

# alternatively in variable
#ita <- gadm(country="ITA", version="latest", level=1, resolution=1, path=tempdir())

typeof(ita) # downloaded data is a S4 class SpatVector

plot(ita)
text(ita, label=ita$NAME_1, cex=0.5, pos=1)

#-------------------------------------------------------------------------------
##### TEMPERATURE DATA (WORLDCLIM) #####
ita_temp <- worldclim_country("ITA", var="tavg", path=tempdir())

colormap <- colorRampPalette(c("blue", "red"))(100)
plot(ita_temp, 
     main=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), 
     col=colormap,
     range=c(-15, 35))
