# Charger les packages nécessaires
library(ggplot2)

# Données ajustées pour les courbes MS Word et Langages de balisage
data <- data.frame(
  Complexity = seq(0, 10, length.out = 100),
  MS_Word = 0.5 * (seq(0, 10, length.out = 100))^1.5,         # Croissance plus rapide pour MS Word
  LaTeX = 1 + 0.3 * (seq(0, 10, length.out = 100))^1.3        # Point d'interception plus élevé et croissance plus lente pour Langages de balisage
)

# Créer le graphique avec axes personnalisés et esthétique Langages de balisage
graph <- ggplot(data) +
  # Courbe MS Word
  geom_line(aes(x = Complexity, y = MS_Word), color = "#E63946", linetype = "dashed", size = 1.2) +
  # Courbe Langages de balisage
  geom_line(aes(x = Complexity, y = LaTeX), color = "#457B9D", size = 1.2) +
  # Labels avec positions ajustées
  annotate("text", x = 3, y = 4, label = "Word", color = "#E63946", hjust = 0, size = 5) +
  annotate("text", x = 6, y = 3.5, label = "Langages de balisage", color = "#457B9D", hjust = 0, size = 5) +
  # Placer "Impossible à faire" en dehors du cadre à droite de la courbe MS Word
  annotate("text", x = 7.3, y = 9.5, label = "Impossible à faire", color = "black", hjust = 0) +
  # Limites et étiquettes des axes
  labs(x = "Complexité et taille du document", y = "Efforts et temps") +
  # Ajuster les limites pour que les courbes s'adaptent exactement
  coord_cartesian(xlim = c(0, 10), ylim = c(0, 10), expand = FALSE) +
  # Thème personnalisé pour un look moderne
  theme_minimal(base_size = 15) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    panel.border = element_rect(color = "black", fill = NA, size = 1.5) # Ajouter une bordure noire autour du graphique
  ) +
  # Ajouter des flèches à la fin des axes
  annotate("segment", x = 10, xend = 10.5, y = 0, yend = 0, arrow = arrow(length = unit(0.2, "cm")), color = "black") +
  annotate("segment", x = 0, xend = 0, y = 10, yend = 10.5, arrow = arrow(length = unit(0.2, "cm")), color = "black")

# Sauvegarder le graphique
ggsave("images/chapitre5_word-vs-latex.png", plot = graph, width = 8, height = 6)

