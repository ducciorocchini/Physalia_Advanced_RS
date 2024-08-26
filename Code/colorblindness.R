# Code for colorblindness check and solving

# Check for color blindness

# install.packages("colorblindcheck")
library(devtools)
# devtools::install_github("clauswilke/colorblindr")
# devtools::install_github("ducciorocchini/cblindplot")
library(colorblindcheck)
library(colorblindr)
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
colorblindr::cvd_grid(explot)

explot2 <- ggplot(iris, aes(Sepal.Length, fill = Species)) + 
  geom_density(alpha = 0.7) + scale_fill_OkabeIto()
explot2

explot + explot2

## cblindplot
rainbowinput = "rainbow.png"
cblindpot::cblind.plot(rainbowinput, cvd= "protanopia")
