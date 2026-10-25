# CLAUDE.md

Ce fichier donne à un assistant de programmation (Claude Code ou un autre) ce qu'il doit savoir pour travailler dans ce dépôt sans le casser. Il complète le [README](README.md), qui s'adresse aux personnes, et le [guide d'uniformisation](UNIFORMISATION.md), qui fixe les conventions d'écriture. En cas de doute, ces deux documents ont raison.

## Le projet

*Outils de recherche en sciences sociales numériques — De l'idéation à la publication scientifique* est un livre collectif de la CLESSN (Chaire de leadership en enseignement des sciences sociales numériques, Université Laval), sous la direction d'Alexis Bibeau-Gagnon, Adrien Cloutier et Yannick Dufresne, publié aux Presses de l'Université Laval. Il est écrit en français, en Quarto, et ses sources sont ouvertes.

Le livre a deux vies : une édition imprimée, figée, et cette version en ligne, qui continue d'évoluer. Chaque chapitre est signé par ses auteurs, dont le nom figure en tête du fichier. **Toute modification au propos d'un chapitre se discute avec les personnes qui le signent.**

## Structure

| Fichier | Contenu |
|---|---|
| `index.qmd` | Prélude |
| `chapitre_1.qmd` à `chapitre_4.qmd` | Fondations : logiciel libre, programmation, gestion de projet, gestion des données |
| `chapitre_5.qmd` à `chapitre_8.qmd` | Structure : synthèse de la connaissance, collecte, visualisation, rédaction |
| `chapitre_9.qmd` | Finition : intelligence artificielle |
| `annexe_a.qmd`, `glossaire.qmd`, `references.qmd` | Annexes |
| `_quarto.yml` | Configuration du livre : ordre des chapitres, format PDF, bibliographie |
| `livre-outils.bib` | Bibliographie, **exportée automatiquement depuis Zotero** (voir plus bas) |
| `filtres/espaces-francaises.lua` | Filtre Pandoc qui pose les espaces insécables de la typographie française |
| `UNIFORMISATION.md` | Conventions d'écriture, de typographie et de formatage |
| `images/`, `data/`, `R/` | Figures, données et scripts appelés par les chapitres |

## Compiler

Toujours compiler le livre entier, depuis la racine :

```bash
quarto render index.qmd --to pdf
```

Ne jamais compiler un chapitre seul : cela crée des dossiers `chapitre_X_files/` et des PDF isolés, casse les renvois entre chapitres et traite la bibliographie à part. Le résultat va dans `_book/`, qui n'est pas suivi par git. Pour travailler avec aperçu, `quarto preview`.

Un assistant ne compile pas de lui-même : il demande à la personne de lancer la commande et de partager les avertissements. Les artéfacts LaTeX (`index.aux`, `index.log`, `index.tex`) ne doivent jamais être commis.

## Bibliographie

`livre-outils.bib` est généré par Better BibTeX à partir de la collection *livre-outils* du groupe Zotero de la CLESSN, avec l'option « Keep updated ». **Ne pas éditer ce fichier à la main** : la prochaine synchronisation écraserait la modification. Une nouvelle référence s'ajoute dans Zotero, jamais dans le `.bib`. Les clés suivent le patron `auteur_etalAA` (`kosmyna_etal25a`, `hao_etal26`) et se citent avec `[@cle]` ou `@cle`. Une clé absente du `.bib` fait échouer le rendu.

## Contribuer

Le dépôt fonctionne par *fork* et *pull request*, décrits pas à pas dans le README. Les étudiants du cours POL-6078 y font un exercice de pull request : ces PR sont les bienvenues et sont traitées par les directeurs du livre, à leur rythme.

- Commits et PR en français, avec un titre qui dit ce qui change et pourquoi.
- Une PR par chapitre quand c'est possible : chaque auteur approuve ce qui touche son chapitre.
- Les commits portent le nom des personnes qui ont fait et validé le changement. L'usage d'outils d'intelligence artificielle dans la préparation du livre est déclaré dans le prélude ; il n'a pas à être répété dans les messages de commit.
- La branche `main` est protégée : une revue approuvée est requise avant la fusion.

## Écrire

Les conventions sont dans `UNIFORMISATION.md`. Les plus souvent oubliées :

- **Emphase** en *italique*, jamais en gras dans une phrase ; le gras est réservé aux têtes d'énumération, aux étiquettes (**Étape 1**, **Important**) et aux entrées de glossaire.
- **Termes anglais** en italique, glosés à leur première apparition : « le flux de travaux (*workflow*) ».
- **Logiciels et commandes** en code : `Git`, `Positron`, `git status`. *Positron* est l'interface de référence pour R, pas RStudio.
- **Désignation des personnes** : termes collectifs et neutres, puis mots épicènes, puis masculin générique ; ni doublets complets ni formes tronquées. Le prélude le déclare en note.
- **Phrases destinées aux encadrés** : elles ne sont pas marquées dans les fichiers. La liste vit dans `UNIFORMISATION.md` et se remet avec le manuscrit.
- **Typographie** : les espaces avant `; : ! ?` et à l'intérieur des guillemets « » sont rendues insécables par le filtre Lua à la compilation ; une espace normale dans la source suffit.
- **Renvois** avec les étiquettes Quarto (`@sec-chap5`, `@fig-…`), jamais « voir le chapitre 5 » en toutes lettres, pour que la numérotation suive.

## Ce qu'un assistant ne fait pas seul

Compiler le livre, fusionner une PR, approuver une revue, fermer une issue, modifier `livre-outils.bib`, ou réécrire le propos d'un chapitre. Il propose, la personne décide.
