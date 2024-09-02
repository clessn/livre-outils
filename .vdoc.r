#
#
#
#
#
#
#
#
#
#
#
#
#| label: fig-vscode
#| echo: false
#| fig-cap: "Exemple d'utilisation du langage de balisage Markdown dans un fichier Quarto sur la plateforme VS Code $\\newline$ *Source*&nbsp;: Auteurs du présent chapitre."
knitr::include_graphics("images/chapitre5_vscode.png", dpi = 600)
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| label: fig-latex-vs-word
#| echo: false
#| fig-cap: "Utilité relative de Word et de $\\LaTeX$ selon la complexité et la taille du document $\\newline$ *Source*&nbsp;: Yannick Dufresne (2015)."
knitr::include_graphics("images/chapitre5_word-vs-latex.png")
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| label: fig-cv
#| echo: false
#| fig-cap: "Exemple de gabarit $\\LaTeX$ de curriculum vitae $\\newline$ *Source*&nbsp;: $\\cite{liantze23}$."
knitr::include_graphics("images/chapitre5_CVtemp.png")
#
#
#
#| label: fig-invoice
#| echo: false
#| fig-cap: "Exemple de gabarit $\\LaTeX$ de feuille de temps $\\newline$ *Source*&nbsp;: $\\cite{roux13}$."
knitr::include_graphics("images/chapitre5_TStemp.png")
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| echo: false
#| warning: false
library(tidyverse)
library(tinytable)

tbl_langages_balisage <- tibble(
    Critères = c('Accessibilité (Gratuit ou peu dispendieux)', 
                 'Existence d\'une communauté d\'utilisateurs', 
                 'Popularité dans le champ', 
                 'Compatibilité avec d\'autres outils', 
                 'Transparence et réplicabilité',
                 'Adaptabilité et flexibilité'),
    'LaTeX' = c('Oui', 
                'Très grande', 
                'Oui', 
                'Moyenne', 
                'Oui', 
                'Très forte'),
    'R Markdown' = c('Oui', 
                    'Grande', 
                    'Oui', 
                    'Forte', 
                    'Oui',
                    'Forte'),
    'Quarto' = c('Oui', 
                    'Moyenne', 
                    'Oui', 
                    'Forte', 
                    'Oui',
                    'Forte')
)

tt(tbl_langages_balisage, width = 0.75, caption = 'Résumé des critères de sélection - Langages de balisage', notes = list(
  a = list(i = 5:5, j = 2, text = "Bien que LaTeX offre une bonne transparence et réplicabilité, son utilisation via Overleaf peut être limitée sans version payante, notamment pour l'intégration avec GitHub et Dropbox. Ces limitations ne s'appliquent pas à des environnements comme RStudio ou VS Code."), 
   b = list(i = 2:2, j = 4, text = "Quarto est relativement récent et semble prendre de plus en plus la place de R Markdown parmis la communauté d'utilisateurs de R. Le nombre d'utilisateurs de Quarto est donc appelé à croitre dans les prochaines années."))
)


#
#
#
#
#
#
