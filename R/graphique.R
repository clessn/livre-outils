library(tidyverse)

# Create the dataset with approximate values from the chart
ai_performance <- data.frame(
  Années = c(1998, 2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016, 2017, 2018, 2019, 2020),

  # Handwriting recognition (pink line)
  `Reconnaissance écrite` = c(-85, -75, -50, -45, -30, -25, -22, -20, -15, -10, -5, -2, 0, 2),

  # Speech recognition (teal line)
  `Reconnaissance vocale` = c(-100, -95, -90, -85, -80, -75, -70, -60, -50, -30, -15, -8, -3, 0),

  # Image recognition (blue line)
  `Reconnaissance images` = c(NA, NA, NA, NA, NA, -100, -90, -80, -60, -40, -20, -10, -5, 0),

  # Reading comprehension (red line)
  `Compréhension écrite` = c(NA, NA, NA, NA, NA, NA, NA, NA, -35, -25, -15, -8, -3, 5),

  # Language understanding (purple line)
  `Compréhension langue` = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, -20, -10, -2, 8),
  check.names = FALSE
)

# Plot with multiple lines
ai_performance_fr_long <- ai_performance %>%
  pivot_longer(cols = -Années, names_to = "Capacité", values_to = "Score") %>%
  filter(!is.na(Score))

df <- data.frame(
  x = c(1999),
  y = c(1),
  text = c("Capacités humaines")
)

red <- data.frame(X = c(1998, 2020), Y = c(-100))
green <- data.frame(X = c(1998, 2020), Y = c(30))

ai_evolution <- ggplot(ai_performance_fr_long, aes(x = Années, y = Score, color = Capacité)) +
  geom_line(size = 1.2) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_text(data = df, aes(x = x, y = y, label = text), color = "black", inherit.aes = FALSE) +
  theme_minimal() +
  geom_area(data = red, aes(x = X, y = Y), alpha = 0.1, fill = "red", inherit.aes = FALSE) +
  geom_area(data = green, aes(x = X, y = Y), alpha = 0.1, fill = "green", inherit.aes = FALSE)
