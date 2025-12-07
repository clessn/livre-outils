library(tidyverse)

# Create the dataset with approximate values from the chart
ai_performance <- data.frame(
  Années = c(
    1998,
    2000,
    2002,
    2004,
    2006,
    2008,
    2010,
    2012,
    2014,
    2016,
    2017,
    2018,
    2019,
    2020
  ),

  # Handwriting recognition (pink line)
  `Reconnaissance\n écrite` = c(
    -85,
    -75,
    -50,
    -45,
    -30,
    -25,
    -22,
    -20,
    -15,
    -10,
    -5,
    -2,
    0,
    2
  ),

  # Speech recognition (teal line)
  `Reconnaissance\n vocale` = c(
    -100,
    -95,
    -90,
    -85,
    -80,
    -75,
    -70,
    -60,
    -50,
    -30,
    -15,
    -8,
    -3,
    0
  ),

  # Image recognition (blue line)
  `Reconnaissance\n images` = c(
    NA,
    NA,
    NA,
    NA,
    NA,
    -100,
    -90,
    -80,
    -60,
    -40,
    -20,
    -10,
    -5,
    0
  ),

  # Reading comprehension (red line)
  `Compréhension\n écrite` = c(
    NA,
    NA,
    NA,
    NA,
    NA,
    NA,
    NA,
    NA,
    -35,
    -25,
    -15,
    -8,
    -3,
    5
  ),

  # Language understanding (purple line)
  `Compréhension\n langue` = c(
    NA,
    NA,
    NA,
    NA,
    NA,
    NA,
    NA,
    NA,
    NA,
    NA,
    -20,
    -10,
    -2,
    8
  ),
  check.names = FALSE
)

# Plot with multiple lines
ai_performance_fr_long <- ai_performance |>
  pivot_longer(cols = -Années, names_to = "Capacité", values_to = "Score") |>
  filter(!is.na(Score))

df <- data.frame(
  x = c(1999),
  y = c(6),
  text = c("Capacités\n humaines")
)

background_areas <- data.frame(
  x = c(1998, 2020),
  ymin_red = c(-100, -100),
  ymax_red = c(0, 0),
  ymin_green = c(0, 0),
  ymax_green = c(30, 30)
)

ai_evolution <- ggplot(
  ai_performance_fr_long,
  aes(x = Années, y = Score, color = Capacité)
) +
  geom_ribbon(
    data = background_areas,
    aes(x = x, ymin = ymin_red, ymax = ymax_red),
    alpha = 0.1,
    fill = "red",
    inherit.aes = FALSE
  ) +
  geom_ribbon(
    data = background_areas,
    aes(x = x, ymin = ymin_green, ymax = ymax_green),
    alpha = 0.1,
    fill = "green",
    inherit.aes = FALSE
  ) +
  geom_line(size = 1) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_text(
    data = df,
    aes(x = x, y = y, label = text),
    color = "black",
    size = 2,
    inherit.aes = FALSE
  ) +
  ylim(-100, 30) +
  xlim(1998, 2020) +
  labs(
    x = "Années"
  ) +
  theme_bw() +
  theme(
    axis.title = element_text(size = 8),
    legend.title = element_text(size = 6),
    legend.text = element_text(size = 5),
    axis.text = element_text(size = 7)
  )
ai_evolution
