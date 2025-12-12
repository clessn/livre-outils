# POL-6078 - Outils numériques de recherche
# Atelier: Visualisation graphique
# Auteur: Adrien Cloutier
# Date: 6 novembre 2025
# ##############################################################################

# OBJECTIF: Apprendre la visualisation de données en 3 étapes
# 1. Se familiariser avec nos données (exploration)
# 2. Résultats préliminaires (graphiques rapides)
# 3. Graphiques finaux pour publication (avancés et peaufinés)

# ##############################################################################
# INSTALLATION ET CHARGEMENT DES PACKAGES ####
# ##############################################################################

# Installer les packages si nécessaire (décommenter si besoin)
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("scales")
install.packages("patchwork")
install.packages("modelsummary")
install.packages("rvest")
install.packages("wordcloud")
install.packages("tm")

# Charger les packages
base::library(tidyverse)
base::library(ggplot2)
base::library(dplyr)
base::library(scales)
base::library(patchwork)  # Pour combiner plusieurs graphiques
base::library(modelsummary)  # Pour les tableaux de régression
base::library(rvest)  # Pour le web scraping
base::library(stringr)  # Pour la manipulation de texte (inclus dans tidyverse)
base::library(wordcloud)  # Pour les nuages de mots
base::library(tm)  # Pour l'analyse de texte (text mining)

# ##############################################################################
# CHARGEMENT DES DONNÉES ####
# ##############################################################################

# Nous utilisons 3 jeux de données:
# 1. CES 2011 (Canadian Election Study) - Étude électorale canadienne
# 2. QoG (Quality of Governance) - Qualité de la gouvernance mondiale
# 3. CSES (Comparative Study of Electoral Systems) - Systèmes électoraux comparés

ces <- readRDS ("Users/Sarah Dulude-Bellavance/Documents/livre-outils-2-/data/cleanCES2011_1.rds")
qofg <- readRDS ("Users/Sarah Dulude-Bellavance/Documents/livre-outils-2-/data/cleanCES2011_1.rds")
cses <- readRDS ("Users/Sarah Dulude-Bellavance/Documents/livre-outils-2-/data/cleanCES2011_1.rds")

# ##############################################################################
# ÉTAPE 1: SE FAMILIARISER AVEC NOS DONNÉES ####
# ##############################################################################
# Objectif: Explorer rapidement les données pour comprendre leur structure

# --- 1.1 Structure générale ---
# glimpse() donne un aperçu complet: dimensions, types de variables, premières valeurs
dplyr::glimpse(ces)

dplyr::glimpse(qofg)

dplyr::glimpse(cses)

# --- 1.2 Fréquences avec table() ---
# Variables catégorielles CES
base::table(ces$age34m)  # Moins de 34 ans
base::table(ces$female)  # Sexe
base::table(ces$educHS)  # Éducation secondaire

# Variables continues - utiliser summary()
qofg %>%
  dplyr::select(taux_dep, esperance_vie, pib_habitant) %>%
  base::summary()

cses %>%
  dplyr::select(age, genre, education) %>%
  base::summary()

# ##############################################################################
# ÉTAPE 2: RÉSULTATS PRÉLIMINAIRES (Graphiques rapides) ####
# ##############################################################################
# Objectif: Créer rapidement des visualisations pour comprendre les données

# --- 2.1 Histogramme simple (CES - Distribution de l'âge) ---

# Préparer les données d'âge (convertir les catégories en numérique)
ces_age <- ces %>%
  dplyr::mutate(age_cat = dplyr::case_when(
    age34m == 1 ~ "18-34",
    age35p54 == 1 ~ "35-54",
    age55p == 1 ~ "55+",
    TRUE ~ NA_character_
  ))

# Graphique rapide
ggplot2::ggplot(ces_age %>% filter(!is.na(age_cat)), aes(x = age_cat)) +
  ggplot2::geom_bar() +
  ggplot2::labs(title = "Distribution des groupes d'âge (CES 2011)")

# --- 2.2 Nuage de points simple (QoG) ---

ggplot2::ggplot(qofg, aes(x = pib_habitant, y = esperance_vie)) +
  ggplot2::geom_point() +
  ggplot2::labs(title = "PIB par personne vs Espérance de vie")

# --- 2.3 Boîte à moustaches (CSES - Âge par genre) ---

cses_clean <- cses %>%
  dplyr::filter(!base::is.na(age), !base::is.na(genre)) %>%
  dplyr::mutate(genre_label = base::ifelse(genre == 1, "Homme", "Femme"))

ggplot2::ggplot(cses_clean, aes(x = genre_label, y = age, fill = genre_label)) +
  ggplot2::geom_boxplot(alpha = 0.7) +
  ggplot2::scale_fill_manual(values = c("Homme" = "#4A90E2", "Femme" = "#E94B7D")) +
  ggplot2::labs(title = "Distribution de l'âge par genre (CSES)",
                x = NULL, y = "Âge") +
  ggplot2::theme_minimal() +
  ggplot2::theme(legend.position = "none")

# ##############################################################################
# ÉTAPE 3: GRAPHIQUES FINAUX POUR PUBLICATION ####
# ##############################################################################
# Objectif: Créer 3 graphiques peaufinés pour un article scientifique
# 1. Graphique descriptif univarié
# 2. Graphique descriptif bivarié
# 3. Tableau de régression


# --- 3.1 GRAPHIQUE UNIVARIÉ: Distribution du vote (CES) ---

# Préparer les données de vote
ces_vote <- ces %>%
  dplyr::mutate(vote_party = dplyr::case_when(
    votedLibALL == 1 ~ "Libéral",
    votedConsALL == 1 ~ "Conservateur",
    votedNdpALL == 1 ~ "NPD",
    votedBlocALL == 1 ~ "Bloc Québécois",
    votedGrnALL == 1 ~ "Vert",
    votedNotALL == 1 ~ "Abstention",
    TRUE ~ "Autre"
  )) %>%
  dplyr::filter(!is.na(vote_party), vote_party != "Autre") %>%
  dplyr::count(vote_party) %>%
  dplyr::mutate(pct = n / base::sum(n) * 100)

# Graphique univarié peaufiné
graph1 <- ggplot2::ggplot(ces_vote, aes(x = stats::reorder(vote_party, -pct), y = pct, fill = vote_party)) +
  ggplot2::geom_col(show.legend = FALSE) +
  ggplot2::scale_fill_manual(values = c("Libéral" = "#D71920",
                                        "Conservateur" = "#1A4782",
                                        "NPD" = "#F37021",
                                        "Bloc Québécois" = "#33B2CC",
                                        "Vert" = "#3D9B35",
                                        "Autre/Abstention" = "grey50")) +
  ggplot2::scale_y_continuous(labels = scales::percent_format(scale = 1),
                              expand = ggplot2::expansion(mult = c(0, 0.05))) +
  ggplot2::labs(title = "Intentions de vote lors de l'élection canadienne de 2011",
                subtitle = "Distribution des votes par parti politique",
                x = NULL,
                y = "Pourcentage des répondants",
                caption = "Source: Canadian Election Study (CES) 2011. N = 4,308.") +
  ggplot2::theme_minimal(base_size = 12) +
  ggplot2::theme(plot.title = ggplot2::element_text(face = "bold", size = 14),
                 plot.subtitle = ggplot2::element_text(color = "grey40"),
                 plot.caption = ggplot2::element_text(hjust = 0, color = "grey50", size = 9),
                 axis.text.x = ggplot2::element_text(angle = 45, hjust = 1),
                 panel.grid.major.x = ggplot2::element_blank(),
                 panel.grid.minor = ggplot2::element_blank())

print(graph1)

# Sauvegarder
ggsave("graphs/graph1_univarie_vote.png", graph1, width = 10, height = 6, dpi = 300)

# --- 3.2 GRAPHIQUE BIVARIÉ: PIB vs Émissions de CO2 (QoG) ---

# EXPLICATION: Pourquoi utiliser l'échelle logarithmique?
# Le PIB varie énormément entre pays (de $500 à $100,000+).
# Sur une échelle linéaire, tous les pays pauvres seraient écrasés à gauche.
# L'échelle logarithmique (log10) permet de mieux voir la relation sur toute la gamme:
#   - $1,000 → base::log10(1000) = 3
#   - $10,000 → base::log10(10000) = 4
#   - $100,000 → base::log10(100000) = 5
# Chaque unité sur l'axe X représente une multiplication par 10 du PIB.

# Nettoyer les données et regrouper les régions
qofg_clean <- qofg %>%
  dplyr::filter(!is.na(pib_habitant),
                !is.na(co2),
                pib_habitant > 0,
                co2 > 0) %>%
  dplyr::mutate(
    log_pib = base::log10(pib_habitant),
    log_co2 = base::log10(co2),  # Log aussi pour CO2 car distribution très dispersée
    region_groupe = dplyr::case_when(
      region %in% base::c("afrique_nord_moyen_orient", "afrique_sub_sah") ~ "Afrique",
      region %in% base::c("amerique_latine", "caraibes") ~ "Amériques",
      region %in% base::c("asie_est", "asie_sud", "asie_sud_est", "pacifique") ~ "Asie-Pacifique",
      region %in% base::c("europe_est_centrale", "europe_ouest_amerique_nord") ~ "Europe-Am. Nord",
      TRUE ~ "Autre"
    )
  )

# Graphique bivarié peaufiné avec régression
graph2 <- ggplot2::ggplot(qofg_clean, aes(x = log_pib, y = log_co2)) +
  ggplot2::geom_point(aes(color = region_groupe, size = acces_elec), alpha = 0.6) +
  ggplot2::geom_smooth(method = "lm", se = TRUE, color = "black", linetype = "dashed", linewidth = 0.8) +
  ggplot2::scale_color_brewer(palette = "Set2", name = "Région") +
  ggplot2::scale_size_continuous(name = "% Accès électricité", range = c(2, 10)) +
  ggplot2::scale_x_continuous(labels = function(x) base::paste0("$", scales::comma(10^x))) +
  ggplot2::scale_y_continuous(labels = function(y) base::paste0(base::round(10^y, 1), " t")) +
  ggplot2::labs(title = "Relation entre richesse économique et émissions de CO2",
                subtitle = "Plus un pays est riche, plus il émet de CO2 par habitant",
                x = "PIB par personne (échelle logarithmique)",
                y = "Émissions de CO2 par habitant (tonnes, échelle log)",
                caption = "Source: Quality of Government Institute. La taille des points représente l'accès à l'électricité (%).\nLa ligne pointillée représente la régression linéaire.") +
  ggplot2::theme_minimal(base_size = 12) +
  ggplot2::theme(plot.title = ggplot2::element_text(face = "bold", size = 14),
                 plot.subtitle = ggplot2::element_text(color = "grey40"),
                 plot.caption = ggplot2::element_text(hjust = 0, color = "grey50", size = 8, lineheight = 1.2),
                 legend.position = "right",
                 panel.grid.minor = ggplot2::element_blank())

print(graph2)

# Sauvegarder
ggsave("graphs/graph2_bivarie_pib_co2.png", graph2, width = 12, height = 7, dpi = 300)

# --- 3.3 TABLEAU DE RÉGRESSION: Déterminants de la liberté économique ---

# Préparer les données pour la régression
qofg_reg <- qofg %>%
  dplyr::filter(!is.na(liberte_econ), !is.na(pib_habitant), pib_habitant > 0) %>%
  dplyr::mutate(log_pib = base::log10(pib_habitant),
                acces_internet_pct = acces_internet * 100)

# Modèle 1: Univarié (PIB seulement)
model1 <- stats::lm(liberte_econ ~ log_pib, data = qofg_reg)

# Modèle 2: Ajouter l'accès à internet
model2 <- stats::lm(liberte_econ ~ log_pib + acces_internet_pct, data = qofg_reg)

# Modèle 3: Modèle complet
model3 <- stats::lm(liberte_econ ~ log_pib + acces_internet_pct + femmes_travail + emploi_agri,
                    data = qofg_reg)

# Créer un tableau de régression professionnel
modelsummary::modelsummary(list("Modèle 1" = model1,
                                "Modèle 2" = model2,
                                "Modèle 3" = model3),
                           stars = TRUE,
                           coef_rename = c("log_pib" = "Log(PIB par personne)",
                                           "acces_internet_pct" = "Accès Internet (%)",
                                           "femmes_travail" = "Femmes actives (%)",
                                           "emploi_agri" = "Emploi agr...
