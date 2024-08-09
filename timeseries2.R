# original code: manuelroncarati

# Valori medi di NDVI per diversi anni

anni <- c(1984, 1993, 2000, 2008, 2014, 2024)
ndvi_medi <- c(0.4296909, 0.5996561, 0.7160403, 0.7347531, 0.7299181, 0.7246805)



# grafico con scala logaritmica sull'asse Y
plot(anni, log(ndvi_medi), type = "o", col = "blue", lwd = 2, pch = 16,
     xlab = "Anno", ylab = "Logaritmo del NDVI Medio", 
     main = "Evoluzione Logaritmica del NDVI Medio nel Tempo")

grid()

#istogramma

barplot(ndvi_medi, names.arg = anni, col = "lightblue", 
        xlab = "Anno", ylab = "NDVI Medio", main = "Istogramma dell'NDVI Medio per Anno",
        ylim = c(0, 1))  # Imposta i limiti sull'asse Y per visualizzare meglio i dati

# Aggiunta di una linea orizzontale che indica la media NDVI totale
abline(h = mean(ndvi_medi), col = "red", lwd = 2, lty = 2)

grid()
