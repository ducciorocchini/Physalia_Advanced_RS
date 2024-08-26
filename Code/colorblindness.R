# Code for colorblindness check and solving

# Check for color blindness

## colorblindcheck

rainbow_pal <- rainbow(7)
colorblindcheck::palette_check(rainbow_pal, plot=TRUE)

## colorblindr

library(ggplot2)
explot <- ggplot(iris, aes(Sepal.Length, fill=Species)) +
geom_density(alpha=0.7)
colorblindr::cvd_grid(explot)

## cblindplot
rainbowinput = "rainbow.png"
cblindpot::cblind.plot(rainbowinput, cvd= "protanopia")
