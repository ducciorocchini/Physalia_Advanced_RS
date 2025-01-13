# AI generated code

## The number of births versus the arrival of storks 
This is a fun and classic example of a spurious correlation that is often used to illustrate the difference between correlation and causation. In this case, the plot would show a positive relationship between the number of storks arriving in a village and the number of births, which is purely coincidental.

> Step 1: Install and load ggplot2
``` r
# Load ggplot2
library(ggplot2)
```

> Step 2: Simulate Data

We'll create a dataset with two variables:
+ Stork arrivals: The number of storks arriving in a village in a given year.
+ Births: The number of births in the same village in the same year.
We'll simulate a positive relationship between these two variables, but keep in mind this is just for illustration, as storks don't actually cause births!

``` r
# Set seed for reproducibility
set.seed(42)

# Simulate data for 20 years
years <- 2000:2019

# Simulate number of storks (random values between 10 and 100)
storks <- sample(10:100, length(years), replace = TRUE)

# Simulate number of births (random values between 50 and 150, with a positive correlation to storks)
births <- storks + rnorm(length(storks), mean = 0, sd = 15)  # Adding a small random noise

# Create a data frame
data <- data.frame(
  year = years,
  storks = storks,
  births = births
)

# Preview the data
head(data)
```

> Step 3: Create the plot with ggplot2
``` r
# Create the plot with ggplot2
p1 <- ggplot(data, aes(x = storks, y = births)) +
  geom_point(color = "green", size = 3) +  # Scatter plot
  geom_smooth(method = "lm", color = "blue", se = FALSE) +  # Add a linear regression line
  labs(
    title = "Positive Relationship Between Stork Arrivals and Births",
    x = "Number of Storks Arriving",
    y = "Number of Births"
  ) +
  theme_minimal()

# Save the plot as a PNG file
ggsave("storks.png", plot = p1, width = 8, height = 6)
```

![storks](https://github.com/user-attachments/assets/70c96769-e703-44ad-a54b-c74e4ae130fe)

## Biomass data in time

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
