# AI generated code

The following code has been automatically generated:

``` r

# Load necessary libraries
library(ggplot2)

# Simulated biomass data over time
years <- seq(2000, 2025, by = 1)
biomass <- c(500, 510, 520, 530, 550, 570, 590, 610, 620, 630, 640, 650, 670, 690, 700, 710, 730, 740, 750, 760, 780, 790, 800, 810, 820, 830)

# Create a data frame
biomass_data <- data.frame(Year = years, Biomass = biomass)

# Create the plot
p <- ggplot(biomass_data, aes(x = Year, y = Biomass)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +

  labs(title = "Vegetation Biomass Trends Over Time",
       x = "Year",
       y = "Biomass (in arbitrary units)") +
  theme_minimal()

# Save the plot as a PNG file
ggsave("biomass_trends.png", plot = p, width = 8, height = 6)
```

![biomass_trends](https://github.com/user-attachments/assets/e5600839-e936-46d3-907f-6b0b57ef7709)
