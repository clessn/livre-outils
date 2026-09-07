# Petit script d'exemple pour découvrir Positron (chapitre 2).
# Exécuter ligne par ligne avec Cmd+Entrée (Ctrl+Entrée sur Windows).

library(tidyverse)

# Lire les données des passagers du Titanic
titanic <- read_csv("data/titanic.csv")

# Jeter un coup d'œil : l'explorateur de données et le volet Variables se remplissent
glimpse(titanic)

# Taux de survie selon la classe et le sexe
survie <- titanic |>
  mutate(sexe = if_else(femme == 1, "Femmes", "Hommes")) |>
  group_by(classe, sexe) |>
  summarise(taux_survie = mean(survie), n = n(), .groups = "drop")

survie

# Un graphique : il apparaît dans le volet Plots
ggplot(survie, aes(x = factor(classe), y = taux_survie, fill = sexe)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = scales::percent) +
  labs(x = "Classe", y = "Taux de survie", fill = NULL,
       title = "Survie des passagers du Titanic selon la classe et le sexe") +
  theme_minimal()
