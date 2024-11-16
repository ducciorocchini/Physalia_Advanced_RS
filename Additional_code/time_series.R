# original code: annaslomp

install.packages("ggplot2")
install.packages("patchwork")
install.packages("raster")
install.packages("viridis")
install.packages("terra")
install.packages("devtools")
install_github ("ducciorocchini/imageRy")
install.packages("tidyverse")
install.packages("sf")
install.packages("tidyr")
install.packages("sp")
install.packages("dplyr")
install.packages("gridExtra")
library(gridExtra)
library(terra)
library(devtools)
library(raster)
library(ggplot2)
library(patchwork)
library(viridis)
library(imageRy)
library(tidyverse)
library(sf)
library(tidyr)
library(sp)
library(dplyr)
# creo collegamento con la cartella diretta:
#setwd("C:/Users/Proprietario/Desktop/Telerilevamento")
#creo la mia lista con tutte le immagini che contengo nella mia cartella diretta
my_im_list <- list.files("C:/Users/Proprietario/Desktop/Telerilevamento")
my_im_list

#seleziono le mie bande partendo dall'immagine a colori naturali scaricata
Calamento_18 <- rast ("18.08_Calamento_tif_colors.tif")
bandar18 <- Calamento_18[[1]]
bandag18 <- Calamento_18[[2]]
bandab18 <- Calamento_18[[3]]
bandanir18 <- Calamento_18[[4]]
C2018 <- c(bandar18, bandag18, bandab18, bandanir18)

Calamento_19 <- rast ("19.08_Calamento_tif_colors.tif")
bandar19 <- Calamento_19[[1]]
bandag19 <- Calamento_19[[2]]
bandab19 <- Calamento_19[[3]]
bandanir19 <- Calamento_19[[4]]
C2019 <- c(bandar19, bandag19, bandab19, bandanir19)

Calamento_20 <- rast ("20.08_Calamento_tif_colors.tif")
bandar20 <- Calamento_20 [[1]]
bandag20 <- Calamento_20[[2]]
bandab20 <- Calamento_20[[3]]
bandanir20 <- Calamento_20[[4]]
C2020 <- c(bandar20, bandag20, bandab20, bandanir20)

Calamento_21 <- rast ("21.08_Calamento_tif_colors.tif")
bandar21 <- Calamento_21 [[1]]
bandag21 <- Calamento_21[[2]]
bandab21 <- Calamento_21[[3]]
bandanir21 <- Calamento_21[[4]]
C2021 <- c(bandar21, bandag21, bandab21, bandanir21)

Calamento_22 <- rast ("22.08_Calamento_tif_colors.tif")
bandar22 <- Calamento_22 [[1]]
bandag22 <- Calamento_22[[2]]
bandab22 <- Calamento_22[[3]]
bandanir22 <- Calamento_22[[4]]
C2022 <- c(bandar22, bandag22, bandab22, bandanir22)

Calamento_23 <- rast ("23.08_Calamento_tif_colors.tif")
bandar23 <- Calamento_23 [[1]]
bandag23 <- Calamento_23[[2]]
bandab23 <- Calamento_23[[3]]
bandanir23 <- Calamento_23[[4]]
C2023 <- c(bandar23, bandag23, bandab23, bandanir23)

#corelazione fra le varie bande
pairs(C2018)
pairs(C2019)
pairs(C2020)
pairs(C2021)
pairs(C2022)
pairs(C2023)


par(mfrow = c(2, 3))
im.plotRGB.auto (C2018) #plotta in automatico le bande
im.plotRGB.auto (C2019)
im.plotRGB.auto (C2020)
im.plotRGB.auto (C2021)
im.plotRGB.auto (C2022)
im.plotRGB.auto (C2023)

#bande:
#visualiziamo NIR nel 2018; posso scaricare le singole bande da Copernicus o 
#utilizzare le bande appenna suddivise:
red_band_18 <- raster ("18.08_Calamento_B01.tif")
red_band_18
green_band_18 <- raster ("18.08_Calamento_B02.tif")
green_band_18
blue_band_18 <- raster ("18.08_Calamento_B03.tif")
blue_band_18
nir_b8_18 <- raster ("18.08_Calamento_B08.tif")
rgb_stack_18 <- stack(red_band_18, green_band_18, blue_band_18, nir_b8_18)  
im.plotRGB (rgb_stack_18, r=4, g=3, b=2) #messo il NIR nel rosso
nir_18 <- rgb_stack_18 [[4]]
plot(nir_18)
clr <- colorRampPalette(c( "blue", "lightgreen", "yellow"))(100) 
par(mfrow = c ( 1, 1))
Plot_nir_18 <- plot(nir_18, col = clr)

#visualiziamo NIR nel 2019
red_band_19 <- raster ("19.08_Calamento_B01.tif")
red_band_19
green_band_19 <- raster ("19.08_Calamento_B02.tif")
green_band_19
blue_band_19 <- raster ("19.08_Calamento_B03.tif")
blue_band_19
nir_b8_19 <- raster ("19.08_Calamento_B08.tif")
rgb_stack_19 <- stack(red_band_19, green_band_19, blue_band_19, nir_b8_19) 
im.plotRGB (rgb_stack_19, r=4, g=3, b=2) #messo il NIR nel rosso
nir_19 <- rgb_stack_19 [[4]]
plot(nir_19)
Plot_nir_19 <- plot(nir_19, col = clr)

#visualiziamo NIR nel 2020
red_band_20 <- raster ("20.08_Calamento_B01.tif")
red_band_20
green_band_20 <- raster ("20.08_Calamento_B02.tif")
green_band_20
blue_band_20 <- raster ("20.08_Calamento_B03.tif")
blue_band_20
nir_b8_20 <- raster ("20.08_Calamento_B08.tif")
rgb_stack_20 <- stack(red_band_20, green_band_20, blue_band_20, nir_b8_20)
im.plotRGB (rgb_stack_20, r=4, g=3, b=2) #messo il NIR nel rosso
nir_20 <- rgb_stack_20 [[4]]
plot(nir_20)
Plot_nir_20 <- plot(nir_20, col = clr)

#visualiziamo NIR nel 2021
red_band_21 <- raster ("21.08_Calamento_B01.tif")
red_band_21
green_band_21 <- raster ("21.08_Calamento_B02.tif")
green_band_21
blue_band_21 <- raster ("21.08_Calamento_B03.tif")
blue_band_21
nir_b8_21 <- raster ("21.08_Calamento_B08.tif")
rgb_stack_21 <- stack(red_band_21, green_band_21, blue_band_21, nir_b8_21)
im.plotRGB (rgb_stack_21, r=4, g=3, b=2) #messo il NIR nel rosso
nir_21 <- rgb_stack_21 [[4]]
plot(nir_21)
Plot_nir_21 <- plot(nir_21, col = clr)

#visualiziamo NIR nel 2022
red_band_22 <- raster ("22.08_Calamento_B01.tif")
red_band_22
green_band_22 <- raster ("22.08_Calamento_B02.tif")
green_band_22
blue_band_22 <- raster ("22.08_Calamento_B03.tif")
blue_band_22
nir_b8_22 <- raster ("22.08_Calamento_B08.tif")
rgb_stack_22 <- stack(red_band_22, green_band_22, blue_band_22, nir_b8_22) 
im.plotRGB (rgb_stack_22, r=4, g=3, b=2) #messo il NIR nel rosso
nir_22 <- rgb_stack_22 [[4]]
plot(nir_22)
Plot_nir_22 <- plot(nir_22, col = clr)

#visualiziamo NIR nel 2023
red_band_23 <- raster ("23.08_Calamento_B01.tif")
red_band_23
green_band_23 <- raster ("23.08_Calamento_B02.tif")
green_band_23
blue_band_23 <- raster ("23.08_Calamento_B03.tif")
blue_band_23
nir_b8_23 <- raster ("23.08_Calamento_B08.tif")
rgb_stack_23 <- stack(red_band_23, green_band_23, blue_band_23, nir_b8_23) 
im.plotRGB(rgb_stack_23, r=4, g=3, b=2) #messo il NIR nel rosso
nir_23 <- rgb_stack_23 [[4]] #messo il NIR nel rosso
plot(nir_23)
Plot_nir_23 <- plot(nir_23, col = clr)

#differenze NDVI per vedere la variazione della vegetazione
#la quantità di vegetazione viva presente in un area si basa sulla differenza tra 
#la banda del NIR e la banda del Rosso:
im.plotRGB(rgb_stack_18, r=3, g=2, b=1) # bande rosso, verde, blu
DVI_18 <- nir_18 - rgb_stack_18 [[3]]
clp2 <- colorRampPalette(c("chocolate", "lightyellow", "darkgreen", "black"))(100)
par(mfrow = c(1, 1))
plot(DVI_18, col = clp2)
NDVI_18 <- DVI_18 / (rgb_stack_18 [[4]] + rgb_stack_18 [[3]])
plot(NDVI_18, col = clp2)

im.plotRGB(rgb_stack_19, r=3, g=2, b=1) # bande rosso, verde, blu
DVI_19 <- nir_19 - rgb_stack_19 [[3]]
par(mfrow = c(1, 1))
plot(DVI_19, col = clp2)
NDVI_19 <- DVI_19 / (rgb_stack_19 [[4]] + rgb_stack_19 [[3]])
plot(NDVI_19, col = clp2)

im.plotRGB(rgb_stack_20, r=3, g=2, b=1) # bande rosso, verde, blu
DVI_20 <- nir_20 - rgb_stack_20 [[3]]
par(mfrow = c(1, 1))
plot(DVI_20, col = clp2)
NDVI_20 <- DVI_20 / (rgb_stack_20 [[4]] + rgb_stack_20 [[3]])
plot(NDVI_20, col = clp2)

im.plotRGB(rgb_stack_21, r=3, g=2, b=1) # bande rosso, verde, blu
DVI_21 <- nir_21 - rgb_stack_21 [[3]]
par(mfrow = c(1, 1))
plot(DVI_21, col = clp2)
NDVI_21 <- DVI_21 / (rgb_stack_21 [[4]] + rgb_stack_21 [[3]])
plot (NDVI_21, col = clp2)

im.plotRGB(rgb_stack_22, r=3, g=2, b=1) # bande rosso, verde, blu
DVI_22 <- nir_22 - rgb_stack_22 [[3]]
par(mfrow = c(1, 1))
plot(DVI_22, col = clp2)
NDVI_22 <- DVI_22 / (rgb_stack_22 [[4]] + rgb_stack_22 [[3]])
plot(NDVI_22, col = clp2)

im.plotRGB(rgb_stack_23, r=3, g=2, b=1) # bande rosso, verde, blu
DVI_23 <- nir_23 - rgb_stack_23 [[3]]
par(mfrow = c(1, 1))
plot(DVI_23, col = clp2)
NDVI_23 <- DVI_23 / (rgb_stack_23 [[4]] + rgb_stack_23 [[3]])
plot(NDVI_23, col = clp2)

#plot differenza temporale
#un alta differenza sta per un alta perdita di vegetazione
#dove troviamo un valore negativo è perchè c'è stato un incremento della vegetazione
ndvi_dif1 = NDVI_18 - NDVI_19 #prima di vai e dopo vaia
clp3 <- viridis (100)
plot(ndvi_dif1, col = clp3) #perdita vegetazione lungo tutto il versante
ndvi_dif2 = NDVI_20 - NDVI_23
plot(ndvi_dif2, col = clp3) 
# riacquisizione di una parte di vegetazione ma comunque perdita in alcuni punti 

#Multivariate Analysis
#PCA 
sample <- sampleRandom(ndvi_dif1, 10000)
pca <- prcomp (sample)
summary(pca)
#un valore maggiore di zero significa che la componente principale cattura una certa quantità di varianza dei dati originali
#quindi qesta componente è utile per rappresentare i dati; se fosse zero non ci sarebbe nessuna variazione dati
pca
pci <- predict(ndvi_dif1, pca, index = c(1:2))
plot(pci)
plot(pci[[1]])

#plot using ggplot
pcid <- as.data.frame(pci [[1]], xy = T)
pcid
ggplot()+
  geom_raster(pcid,
              mapping = aes (x = x, y = y, fill = layer.1)) +
  scale_fill_viridis(name = "PC1 values") +
  labs (title = "PCA of NDVI difference 2018 - 2019")

#ora osserviamo la differenza di vegetazione dal 2020 fino al 2023
sample1 <- sampleRandom(ndvi_dif2, 10000)
pca1 <- prcomp (sample1)
summary(pca1)
pca1
pci1 <- predict(ndvi_dif2, pca1, index = c(1:2))
plot(pci1)
plot(pci1[[1]])
pcid1 <- as.data.frame(pci1 [[1]], xy = T)
pcid1
ggplot()+
  geom_raster(pcid1,
              mapping = aes (x = x, y = y, fill = layer.1)) +
  scale_fill_viridis(name = "PC2 values") +
  labs (title = "PCA of NDVI difference 2020 - 2023")

#deviazione standard
library(raster)
sd_18_19 <- focal (pci [[1]], matrix(1/9, 3, 3), fun = sd)
sd_20_23 <- focal (pci1 [[1]], matrix(1/9, 3, 3), fun = sd)
sd_18_19_d <- as.data.frame(sd_18_19, xy = T)
sd_20_23_d <- as.data.frame(sd_20_23, xy = T)

# Plot deviazione standard

ggplot() +
  geom_raster (sd_18_19_d, 
               mapping = aes(x = x, y = y , fill = layer)) +
  scale_fill_viridis() +
  labs(title = "deviazione standard 2018_2019")
      
ggplot() +
  geom_raster (sd_20_23_d, 
               mapping = aes(x = x, y = y , fill = layer)) +
  scale_fill_viridis() +
  labs(title = "deviazione standard 2020_2023")

#classificazione: selezione del numero di livelli energetici nell'immagine per capire la 
#copertura vegetale. Si ottiene un confronto per osservare la variazione nel tempo della copertura vegetale. 

par(mfrow = c(2, 3))
cl2018 <- im.classify(C2018, num_clusters = 3)
cl2019 <- im.classify(C2019, num_clusters = 3)
cl2020 <- im.classify(C2020, num_clusters = 3)
cl2021 <- im.classify(C2021, num_clusters = 3)
cl2022 <- im.classify(C2022, num_clusters = 3)
cl2023 <- im.classify(C2023, num_clusters = 3)

#si genera un cluster che prende dei pixel casuali selezionati dall'algoritmo;
#trovo la frequenza dei pixel di ogni classe
f2018 <- freq (cl2018)
f2018
tot2018 <- ncell (C2018)
tot2018
prop2018 = f2018 / tot2018
prop2018
perc2018 = prop2018 * 100
perc2018
f2019 <- freq (cl2019)
f2019
tot2019 <- ncell (C2019)
tot2019
prop2019 = f2019 / tot2019
perc2019 = prop2019 *100
perc2019
f2020 <- freq (cl2020)
f2020
tot2020 <- ncell (C2020)
tot2020
prop2020 = f2020 / tot2020
perc2020 = prop2020 *100
perc2020
f2021 <- freq (cl2021)
f2021
tot2021 <- ncell (C2021)
tot2021
prop2021 = f2021 / tot2021
perc2021 = prop2021 *100
perc2021
f2022 <- freq (cl2022)
f2022
tot2022 <- ncell (C2022)
tot2022
prop2022 = f2022 / tot2022
perc2022 = prop2022 *100
perc2022
f2023 <- freq (cl2023)
f2023
tot2023 <- ncell (C2023)
tot2023
prop2023 = f2023 / tot2023
perc2023 = prop2023 *100
perc2023
#creiamo un dataframe
class_2018_2023 <- c("Suolo nudo", "Foresta", "Spazi aperti in vetta")
y2018 <- c(27.999, 52.562, 19.438)
y2019 <- c(30.854, 44.678, 24.468)
y2020 <- c(30.427, 45.211, 24.362)
y2021 <- c(31.364, 45.354, 23.281)
y2022 <- c(33.401, 46.744, 19.854)
y2023 <- c(35.034, 45.747, 19.217)

tabella1 <- data.frame(class_2018_2023, y2018, y2019, y2020, y2021, y2022, y2023 )
tabella1
str(tabella1)

grafico_18 <- ggplot(tabella1, aes(x = class_2018_2023, y = y2018)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Foresta e Suolo 2018",
       x = "Classificazione",
       y = "Percentuale")
grafico_19 <- ggplot(tabella1, aes(x = class_2018_2023, y = y2019)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Foresta e Suolo 2019",
       x = "Classificazione",
       y = "Percentuale")     
grafico_20 <- ggplot(tabella1, aes(x = class_2018_2023, y = y2020)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Foresta e Suolo 2020",
       x = "Classificazione",
       y = "Percentuale")  
grafico_21 <- ggplot(tabella1, aes(x = class_2018_2023, y = y2021)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Foresta e Suolo 2021",
       x = "Classificazione",
       y = "Percentuale")  
grafico_22 <- ggplot(tabella1, aes(x = class_2018_2023, y = y2022)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Foresta e Suolo 2022",
       x = "Classificazione",
       y = "Percentuale")  
grafico_23 <- ggplot(tabella1, aes(x = class_2018_2023, y = y2023)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Foresta e Suolo 2023",
       x = "Classificazione",
       y = "Percentuale")  
grid.arrange(grafico_18, grafico_19, grafico_20, grafico_21, grafico_22, grafico_23, ncol = 3 )

#tendenza della crescita di vegetazione per l'anno 2024
ndvi_dif3 <- NDVI_18 - NDVI_23
ndvi_dif3
ndvi_data <- data.frame(data = seq.Date(as.Date("2018-01-01"), as.Date("2024-01-01"),
                                        by = "month"),
                        ndvi_dif3 = runif(73, min = -0.605042, max = 0.5764411))
#converto i dati in una serie temporale
ts_ndvi <- ts (ndvi_data$ndvi_dif3, 
              start = c(2018, 1), 
              frequency = 12)
#converto i dati per ggplo2
data_df_ndvi <- data.frame(TEMPO = time(ts_ndvi),
                           NDVI = as.numeric(ts_ndvi))
data_df_ndvi
ggplot(data_df_ndvi, aes(x = TEMPO, y = NDVI)) + 
  geom_smooth(method = "loess") +
  labs(title = "Tendenza crescita NDVI",
       x = "Anni",
       y = "NDVI")+
  theme_minimal()
  
#accuratezza del modello
accuracy(forecasted_values, test_data)
