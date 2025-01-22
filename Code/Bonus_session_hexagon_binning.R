library(terra)
library(imageRy)
library(hexbin)

dol <- im.import("sentinel.dol")

dol

dol1 = dol[[1]]
dol2 = dol[[2]]
plot(dol1, dol2)

library(hexbin)

dold = as.data.frame(dol1)
dol2d = as.data.frame(dol2)

hbin = hexbin(dold[[1]], dol2d[[1]], xbins = 40)
plot(hbin)
 
