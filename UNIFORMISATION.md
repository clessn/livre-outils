# Guide d'uniformisation des chapitres

Ce document établit les règles d'uniformisation pour l'écriture et la révision des chapitres du livre "Outils de recherche en sciences sociales numériques".

## Table des matières

1. [Temps et modes verbaux](#temps-et-modes-verbaux)
2. [Personne et voix](#personne-et-voix)
3. [Langage inclusif](#langage-inclusif)
4. [Terminologie spécifique](#terminologie-spécifique)
5. [Style et ton](#style-et-ton)
6. [Références et citations](#références-et-citations)
7. [Formatage](#formatage)

---

## Temps et modes verbaux

### Règle générale : Privilégier le présent

**Utiliser le présent de l'indicatif** autant que possible pour :
- Les descriptions
- Les explications
- Les démonstrations
- Les constats

✅ **Correct :**
- "Le logiciel libre permet une grande flexibilité"
- "Les chercheurs utilisent `R` pour leurs analyses"
- "`Git` facilite la collaboration"

❌ **À éviter :**
- "Le logiciel libre permettra une grande flexibilité"
- "Les chercheurs utilisaient `R` pour leurs analyses"

### Exceptions acceptées

**Passé composé** : pour des événements historiques ou des faits avérés dans le passé
- "Richard Stallman a fondé la Free Software Foundation en 1985"
- "Le mouvement du logiciel libre a émergé dans les années 1980"

**Futur simple** : uniquement pour indiquer des sections à venir dans le livre
- "Le @sec-chap8 approfondira ce point"
- "Nous aborderons cette question dans le prochain chapitre"

**Conditionnel** : pour les hypothèses, les conseils nuancés
- "Il serait préférable de..."
- "Cela pourrait permettre de..."

---

## Personne et voix

### Règle générale : 3e personne

**Utiliser la 3e personne** pour :
- Les descriptions générales
- Les explications techniques
- Les constats scientifiques

✅ **Correct :**
- "Le chercheur doit s'assurer que..."
- "Les utilisateurs peuvent télécharger..."
- "L'outil permet de..."

❌ **À éviter :**
- "Vous devez vous assurer que..."
- "Tu peux télécharger..."

### Exception : Le "nous" inclusif

**Utiliser "nous"** uniquement quand :
- On donne un conseil direct au lecteur
- On inclut explicitement les auteurs ET les lecteurs dans une démarche commune
- On présente les choix faits dans ce livre

✅ **Correct :**
- "Nous recommandons l'utilisation de `R`"
- "Comme nous l'avons présenté dans la section précédente"
- "Nous avons choisi ces outils en fonction de..."
- "Il nous faut réfléchir à notre façon de comprendre..."

**Ne pas mélanger** "nous" et "le chercheur" dans le même contexte :

❌ **À éviter :**
- "Le chercheur doit organiser son espace de travail. Nous devons donc utiliser Git."

✅ **Correct :**
- "Le chercheur doit organiser son espace de travail. L'utilisation de Git facilite cette organisation."
- "Nous recommandons d'organiser son espace de travail avec Git."

---

## Langage inclusif

### Règle générale : Inclusif simple, sinon masculin

**Stratégies d'écriture inclusive (par ordre de préférence) :**

#### 1. Termes neutres et collectifs
✅ **Préférer :**
- "les chercheurs" (au lieu de "les chercheuses et chercheurs")
- "le lectorat" (au lieu de "les lecteurs et lectrices")
- "les utilisateurs" (générique)
- "la communauté scientifique"
- "le personnel"

#### 2. Doublets complets (usage modéré)
Utiliser **uniquement quand le contexte le justifie** et **sans alourdir** :

✅ **Acceptable :**
- "les étudiants et les étudiantes" (si utilisé 1-2 fois dans un chapitre)
- "ceux et celles qui souhaitent"

❌ **À éviter** (répétition excessive) :
- "les chercheurs et chercheuses doivent organiser leur espace de travail. Les développeurs et développeuses contribuent..."

#### 3. Masculin générique par défaut
Lorsque les stratégies ci-dessus alourdissent le texte :

✅ **Utiliser le masculin générique :**
- "les chercheurs"
- "les étudiants"
- "les développeurs"
- "le lecteur"

### Formes à éviter

❌ **Ne JAMAIS utiliser :**
- Point médian : "les chercheur·euse·s"
- Parenthèses : "les chercheur(euse)s"
- Tiret : "chercheur-euse-s"
- Barre oblique : "chercheur/euse/s"

---

## Terminologie spécifique

### Expressions en français (préférées)

| ❌ À éviter (anglais) | ✅ À utiliser (français) |
|----------------------|-------------------------|
| open source | code source ouvert / code ouvert |
| free software | logiciel libre |
| workflow | flux de travail |
| open science | science ouverte |
| design de recherche | plan de recherche / protocole de recherche |
| cloud | nuage / serveurs externes |

### Exceptions : Quand conserver l'anglais

**Conserver l'expression anglaise** uniquement dans ces cas :

1. **Lors de la première présentation du concept** (avec traduction) :
   - "Le code source ouvert, ou *open source*, se distingue du logiciel libre..."
   - "Le flux de travail (*workflow*) permet d'organiser..."

2. **Noms propres et noms de logiciels** :
   - "Open Science Framework" (nom de plateforme)
   - "GitHub", "Stack Overflow" (noms de services)
   - `RStudio`, `Quarto` (noms de logiciels)

3. **Termes techniques non traduisibles ou citations** :
   - "*free* en anglais" (quand on explique l'ambiguïté du terme)
   - "*shareware*" (type de licence spécifique)

### Uniformisation des termes récurrents

| Concept | Terme à utiliser | Notes |
|---------|------------------|-------|
| Logiciel libre | logiciel libre | Pas "logiciel gratuit" |
| Code ouvert | code source ouvert / code ouvert | Les deux acceptés |
| Logiciel privé | logiciel propriétaire | Pas "logiciel payant" |
| Utilisateur | utilisateur | Pas "user" |
| Communauté | communauté d'utilisateurs | Pas "community" |
| Librairie (R) | librairie | Accepté en français (malgré anglicisme) |
| Package (R) | librairie / extension | Préférer "librairie" |
| Code source | code source | Pas "source code" |
| Script | script | Accepté tel quel |

---

## Style et ton

### Ton académique mais accessible

- **Éviter le jargon** inutile
- **Expliquer les termes techniques** lors de leur première utilisation
- **Utiliser des exemples concrets**
- **Privilégier les phrases courtes** et claires

### Cohérence dans les exemples

- Utiliser `R` comme exemple principal pour les analyses statistiques
- Utiliser `RStudio` comme interface de référence
- Utiliser Git/GitHub pour la gestion de versions
- Utiliser Zotero pour la bibliographie

### Structure des chapitres

Chaque chapitre devrait suivre cette structure générale :
1. Introduction (contexte et objectifs)
2. Présentation du concept/outil
3. Avantages et limites
4. Exemples pratiques
5. Tableaux récapitulatifs des critères

---

## Références et citations

### Format des citations

- Utiliser le format `@auteur_annee` pour les citations dans le texte
- Exemple : `[@king_etal21]` ou `@stallman86`

### Références aux chapitres

- Utiliser les labels de section : `@sec-chap1`, `@sec-chap8`
- Exemple : "Comme nous l'avons vu dans le @sec-chap1"

### Notes de bas de page

- Numérotation automatique avec `[^chapitre_1-1]`
- Utiliser pour les précisions, pas pour les définitions essentielles

---

## Ponctuation et typographie française

### Guillemets

**Toujours utiliser les guillemets français** (chevrons) :

✅ **Correct :**
- « logiciel libre »
- « améliorer » (avec guillemets français)
- Il a dit : « La transparence est essentielle. »

❌ **Incorrect :**
- "logiciel libre" (guillemets anglais)
- "améliorer" (guillemets anglais)

**Règle des espaces** avec les guillemets français :
- Espace insécable **avant** le guillemet ouvrant : `«`
- Espace insécable **après** le guillemet fermant : `»`
- Format complet : `mot « citation » mot`

### Espaces et ponctuation

**Ponctuation haute** (nécessite une espace insécable avant) :
- ` :` (deux-points)
- ` ;` (point-virgule)
- ` !` (point d'exclamation)
- ` ?` (point d'interrogation)

✅ **Correct :**
- "Quatre libertés : utiliser, copier, étudier, modifier."
- "Est-ce correct ?"

❌ **Incorrect :**
- "Quatre libertés: utiliser, copier, étudier, modifier." (manque espace)
- "Est-ce correct?" (manque espace)

**Ponctuation basse** (pas d'espace avant) :
- `.` (point)
- `,` (virgule)

### Tirets et traits d'union

**Trait d'union** `-` : pour les mots composés
- "libre-échange"
- "sciences sociales" (pas de trait d'union ici)

**Tiret moyen** `–` (ou `--` en Markdown) : pour les incises
- "Le logiciel libre --- et le code source ouvert --- favorise la collaboration"

**Tiret long** `—` : rarement utilisé en français

### Apostrophes

**Utiliser l'apostrophe courbe** `'` (pas l'apostrophe droite `'`) :

✅ **Correct :**
- "l'utilisateur"
- "d'organiser"

❌ **Incorrect :**
- "l'utilisateur" (apostrophe droite)

### Points de suspension

**Toujours trois points** sans espace avant :

✅ **Correct :**
- "et bien plus..."
- "etc."

❌ **Incorrect :**
- "et bien plus ..." (espace avant)
- "et bien plus...." (quatre points)

---

## Grammaire et accords

### Accords des participes passés

**Avec avoir** : accord avec le COD s'il est placé avant
- "Les données que nous avons **collectées**" (COD avant : les données)
- "Nous avons collecté des données" (COD après : pas d'accord)

**Avec être** : accord avec le sujet
- "La philosophie est **présentée**"
- "Les outils sont **présentés**"

### Accords des pronoms relatifs

**Qui** : reprend le sujet (masculin/féminin, singulier/pluriel)
- "des logiciels qui **sont** libres"
- "une licence qui **est** libre"

**Auquel, auxquels, auxquelles** : accord en genre et nombre
- "le développement **auquel** les utilisateurs participent"
- "les données **auxquelles** on a accès"

### Prépositions courantes

**Comparer** : utiliser "à" ou "avec"
- "comparer `R` **à** SPSS"
- "en comparaison **avec** SPSS"

❌ Pas : "comparer `R` et SPSS" (pour une vraie comparaison)

**Permettre** : "permettre **à** quelqu'un **de** faire"
- "Cela permet **aux** chercheurs **de** collaborer"

❌ Pas : "permet pour les chercheurs"

**Participer** : "participer **à**"
- "participer **au** développement"

❌ Pas : "participer dans le développement"

### Expressions à corriger

| ❌ Incorrect (calque anglais) | ✅ Correct (français) |
|------------------------------|----------------------|
| au moment d'écrire ces lignes | au moment où nous écrivons ces lignes |
| de même que pour | de même qu'avec / comme pour |
| rester confronté à | demeurer confronté à / faire face à |
| être basé sur | être fondé sur / reposer sur |
| adresser un problème | résoudre un problème / traiter d'un problème |

---

## Formatage

### Code et noms de logiciels

#### Logiciels avec symboles spéciaux

**R** : toujours utiliser la commande LaTeX pour le logo officiel
- ✅ Correct : `\textsf{R}` (affiche le logo R avec la bonne police)
- ❌ Incorrect : `` `R` `` (backticks - rendu incorrect)
- ❌ Incorrect : `R` (texte simple)

**LaTeX** : toujours utiliser la commande LaTeX
- ✅ Correct : `\LaTeX` (affiche le logo LaTeX avec mise en forme)
- ❌ Incorrect : `LaTeX` (texte simple)

#### Noms de logiciels et extensions

- **Extensions/librairies R** : utiliser backticks
  - `` `dplyr` ``, `` `tidyverse` ``, `` `ggplot2` ``

- **Interfaces et éditeurs** : utiliser backticks pour logiciels de code
  - `` `RStudio` ``, `` `VS Code` ``, `` `Quarto` ``

- **Logiciels propriétaires** : en italique
  - *SPSS*, *STATA*, *Excel*, *Microsoft Word*

#### Noms de compagnies, plateformes et services

**Toujours en italique** :
- Compagnies : *IBM*, *Microsoft*, *StataCorp*, *Posit*
- Plateformes : *GitHub*, *Stack Overflow*, *Dropbox*
- Systèmes : *Firefox*, *Linux*, *OpenOffice*
- Services web : *Open Science Framework*, *Datacamp*, *CodeAcademy*

#### Expressions en anglais

- **Termes techniques en anglais** : utiliser l'italique
  - *open source*, *workflow*, *free software*, *shareware*
  - *cloud*, *clustering*, *design*

### Emphases

- **Gras** : pour les termes importants à retenir
- *Italique* : pour les expressions étrangères et les titres d'ouvrages
- `Code` : pour les noms de logiciels, fonctions, commandes

### Listes et énumérations

- Utiliser des tirets `-` pour les listes non ordonnées
- Utiliser des numéros `1.`, `2.` pour les listes ordonnées
- Maintenir la cohérence des ponctuations dans les listes

---

## Exemples avant/après

### Exemple 1 : Temps et personne

❌ **Avant :**
> Dans le prochain chapitre, nous allons voir comment vous pouvez utiliser Git pour gérer vos projets. Vous devrez d'abord installer le logiciel.

✅ **Après :**
> Le @sec-chap4 présente l'utilisation de Git pour la gestion de projets. Le chercheur doit d'abord installer le logiciel.

### Exemple 2 : Terminologie

❌ **Avant :**
> L'open source permet de contribuer au développement du software. Le workflow devient plus efficace avec ces outils.

✅ **Après :**
> Le code source ouvert permet de contribuer au développement du logiciel. Le flux de travail devient plus efficace avec ces outils.

### Exemple 3 : Inclusivité

❌ **Avant :**
> Les chercheurs et chercheuses doivent organiser leur espace de travail. Les développeurs et développeuses contribuent au code. Les utilisateurs et utilisatrices bénéficient de ces améliorations.

✅ **Après :**
> Les chercheurs doivent organiser leur espace de travail. Les développeurs contribuent au code. Les utilisateurs bénéficient de ces améliorations.

### Exemple 4 : Style académique

❌ **Avant :**
> C'est vraiment important que tu comprennes bien que l'utilisation de R va être super utile pour tes analyses futures.

✅ **Après :**
> L'apprentissage de `R` présente des avantages importants pour les analyses futures. Les compétences acquises s'inscrivent dans la longue durée.

---

## Erreurs fréquentes à surveiller

### Accords et conjugaisons

- **Sujet collectif + verbe** : accorder avec le sujet principal
  - ❌ "L'accès aux données et la liberté de contribuer **constitue**"
  - ✅ "L'accès aux données et la liberté de contribuer **constituent**"

- **Avec "et al."** : toujours pluriel
  - ❌ "@king_etal21 **propose**"
  - ✅ "@king_etal21 **proposent**"

- **Participe présent vs adjectif** :
  - ❌ "étant **compatible** avec" (invariable si participe présent)
  - ✅ "étant **compatibles** avec" (accord si adjectif)

### Confusion de termes

- **À/a** :
  - "a" = verbe avoir
  - "à" = préposition
  - ❌ "LaTeX **à** ses bénéfices"
  - ✅ "LaTeX **a** ses bénéfices"

- **Peut-être/peut être** :
  - "peut-être" = adverbe (maybe)
  - "peut être" = verbe pouvoir + verbe être
  - ❌ "ce dernier **peut-être** adapté"
  - ✅ "ce dernier **peut être** adapté"

- **Tel/tels/telle/telles** : accord avec ce qui suit
  - ❌ "**tels** que la popularité" (la = féminin)
  - ✅ "**telles** que la popularité"

### Pluriels oubliés

- ❌ "lors de recherche ultérieure"
- ✅ "lors de **recherches ultérieures**"

- ❌ "en tant que chercheur" (avec "nous")
- ✅ "en tant que **chercheurs**"

- ❌ "l'existence de forum d'aide"
- ✅ "l'existence de **forums** d'aide"

### Structure des phrases

**Parallélisme grammatical** :
- ❌ "plutôt que d'apprendre"
- ✅ "plutôt **qu'à** apprendre" (parallèle avec "à tenter")

**Éviter les relatives inutiles** :
- ❌ "Celles-ci visent à collecter, **et qui ont** pour but"
- ✅ "Celles-ci visent à collecter **et ont** pour but"

---

## Checklist de révision

Lors de la révision d'un chapitre, vérifier :

### Contenu et structure
- [ ] Tous les verbes sont au présent (sauf exceptions justifiées)
- [ ] La 3e personne est utilisée de manière cohérente
- [ ] Le "nous" est réservé aux conseils et choix d'auteurs
- [ ] Les termes français sont privilégiés (logiciel libre, code source ouvert)
- [ ] Les anglicismes sont en italique lors de leur présentation
- [ ] Le langage inclusif est simple (termes neutres ou masculin générique)

### Grammaire et orthographe
- [ ] Tous les accords sujet-verbe sont corrects (attention aux sujets multiples)
- [ ] Tous les accords des participes passés sont corrects
- [ ] Tous les accords des adjectifs sont corrects (genre et nombre)
- [ ] Tous les accords des pronoms relatifs sont corrects (qui/que/auquel/auxquels)
- [ ] Pas de confusion à/a, peut-être/peut être
- [ ] Tous les pluriels sont présents (recherches, chercheurs, forums)
- [ ] Parallélisme grammatical respecté dans les comparaisons
- [ ] Pas de calques de l'anglais (au moment d'écrire → au moment où nous écrivons)
- [ ] Prépositions correctes (comparer à/aux, participer à, permettre à...de)

### Ponctuation et typographie
- [ ] Guillemets français « » utilisés (jamais " ")
- [ ] Espaces insécables avant : ; ! ?
- [ ] Apostrophes courbes ' utilisées (pas ')
- [ ] Points de suspension : trois points sans espace avant (...)

### Formatage et style
- [ ] Pas de point médian, parenthèses, ou barres obliques pour l'inclusivité
- [ ] Les noms de logiciels de programmation sont entre backticks `` `R` ``
- [ ] Les expressions anglaises sont en italique *workflow*
- [ ] Les références croisées utilisent `@sec-chapX`
- [ ] Les citations utilisent `@auteur_annee`
- [ ] Le ton est académique mais accessible
- [ ] Les phrases sont claires et concises

---

## Notes finales

Ce guide est un document vivant qui peut être amendé au fur et à mesure des besoins. Les auteurs et réviseurs sont encouragés à s'y référer régulièrement lors de la rédaction et de la correction des chapitres.

**Principe directeur** : La cohérence et la clarté priment sur la rigidité. Si une règle nuit à la compréhension, elle peut être adaptée, mais la modification doit être documentée ici pour maintenir l'uniformité.
