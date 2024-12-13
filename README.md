# Physalia_Advanced_RS
Advanced Ecological Remote Sensing in R

Daily schedule: 15:00 - 18:00 (Berlin time)


> Overview

The course addresses spatial analysis of remote sensing data, making use of the most important packages in R containing advanced techniques.

By the end of the course, participants will gain proficiency in coding their own analysis workflows and effectively reporting their findings using Markdown and LaTeX. The final part of the course will cover the fundamentals of LaTeX scripting for both articles and presentations.


> Learning outcomes

- Spatio-ecological modelling of remote sensing data

- Proper RS data analysis scripting in GitHub and reporting via Markdown

- Proper reporting in LaTeX for coding texts and output reporting

> Packages needed

For packages to be installed from GitHub the devtools::install_github() function is used, for the other packages the install.packages() function is used. 

## Packages needed:
+ ggplot2
+ patchwork
+ imageRy: for RS data analysis
+ terra: for RS data analysis
+ colorblindcheck: for colorblind tests
+ colorblindr: for colorblind tests
+ viridis: for colorblind tests
+ rasterdiv: to measure variability
+ ggridges: for ridgeline plots
+ tidyverse: for ridgeline plots

Installing packages from GitHub:
+ library(devtools)
+ devtools::install_github("clauswilke/colorblindr")
+ devtools::install_github("ducciorocchini/cblindplot")
+ devtools::install_github("ducciorocchini/imageRY")
  
## Session 1 – Introduction (Monday, 3h)

- Introduction to ecological remote sensing

- Reference systems: introduction to the main coordinate systems

- The imageRy R package: how to develop your RS package
[R packages: imageRy, terra]

## Session 2 –  Measuring variability (Tuesday, 3h)

- How to measure ecosystem variability in space and time by information theory measures

- Measuring variability via spectral distances

- The rasterdiv R package to couple information theory and spectral distances

## Session 3 – Species distribution modelling with RS based variables (Wednesday, 1.5h)

- The sdm R package to model species distributions

## Session 4 - Colorblind friendly maps (Wednesday, 1.5h)

- How to deal with colorblindness

- R Packages related to colorblindness


## Session 5 - Reporting (Thursday, 3h)

- Proper coloring of RS based graphs for colorblind people

- Using Markdown to write R documentation

- Using LaTeX for article and presentation based reporting



# Previous: Physalia_Advanced_RS
Advanced Ecological Remote Sensing in R


## Session 1 – Introduction (Monday)

- Introduction to ecological remote sensing

- Reference systems: introduction to the main coordinate systems

- The imageRy R package: how to develop your RS package
[R packages: imageRy, terra]

## Session 2 – R eco-packages (Tuesday)

- The ecochange R package: measuring landscape changes in space and time

- The ggridges R package for multitemporal analysis

- The geodata R package: geographical data download worldwide

## Session 3 – Species distribution modelling with RS based variables (Wednesday)

- The sdm R package to model species distributions

- The ecospat R package to investigate different modelling techniques for species distributinos

- The fuzzySim R to calculate fuzzy similarity in species distributions

## Session 4 - Measuring variability (Thursday)

- How to measure ecosystem variability in space and time by information theory measures

- Measuring variability via spectral distances

- The rasterdiv R package to couple information theory and spectral distances
