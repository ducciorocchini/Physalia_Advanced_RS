library(imageRy)
library(ggridges)
library(tidyverse)

im.list()
green <- im.import("green")
im.ridgeline(green, 2, "A")

names(green) <- c(2000, 2010, 2015, 2020)
im.ridgeline(green, 2, "A")
