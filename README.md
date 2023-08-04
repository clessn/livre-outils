
<!-- README.md is generated from README.Rmd. Please edit that file -->

# livre-outils

<!-- badges: start -->
<!-- badges: end -->

Livre d’outils.

## Getting started

### Getting your repo ready
1.  Install [Quarto](https://quarto.org/docs/get-started/)
2.  Clone the repository
3.  Get access to the Dropbox SharedFolder
4.  Place the Dropbox SharedFolder within the repository

To learn how to use Quarto visit [quarto.org](https://quarto.org/) .

To learn more about Quarto books visit <https://quarto.org/docs/books>.
### Installation et configuration de Zotero 

Dans cette section, vous serez amené à Installer Zotero ainsi que Better Bibtex, un extension de Zotero servant à générer et maintenir à jour des fichiers .bib à partir de Zotero.

#### Zotero

- Installer [Zotero](https://www.zotero.org/download/)
- Installer [Zotero Connector](https://www.zotero.org/download/)

- Une fois Zotero installé, créer un [compte Zotero](https://www.zotero.org/user/register/). Prenez note de votre identifiant et partagez le avec Laurence-Olivier pour qu'il vous ajoute sur le groupe Zotero CLESSN.

- Allez dans vos courriels et suivez les directives pour joindre le groupe Zotero CLESSN.

#### Better Bibtex

- La prochaine étape sera d'installer [Better BibTex](https://retorque.re/zotero-better-bibtex/installation/). Pour ce faire, allez dans l'onglet tools > Add-ons ensuite cliquez sur l'icone de paramètre et faites Install Add-on From File. Sélectionnez le fichier .xpi que vous avez téléchargé.

*IMPORTANT* 

- Une fois l'add-on installé, allez dans les paramètres de Better Bibtex en allant dans l'onglet Zotero > Settings > Onglet Better Bibtex>Open Better Bibtex preferences...

- Dans la section Citation Key Format, collez ceci: `authEtal2.fold.lower.replace(find=".",replace=_) + len + shortyear | veryshorttitle + shortyear`

#### Génération du fichier .bib 

Dans Zotero, vous devriez maintenant voir le groupe Zotero CLESSN dans les Group Libraries. 

*Il est important de comprendre que tout changement que vous faites dans Zotero sera automatiquement synchronisé avec le groupe Zotero CLESSN. Si vous supprimez une référence, elle sera supprimée pour tout le monde!*

Clic-droit sur la collection livre-outils > Export Collection choisissez le format Better BibLaTex et cochez la case [x] Keep updated. Faites OK et sauvegardez le fichier dans le dossier .git du projet livre-outils. Ce dossier sera constamment mis à jour avec les changements que vous faites dans Zotero et sera synchronisé avec le projet Github quand vous ferez vos pull requests.

#### Utilisation de Zotero lors de l'écriture

Lors de l'écriture, vous n'avez qu'a écrire @ dans votre éditeur pour faire sortir la palette de référencement.

#### Ajouter des références à Zotero

Il y a différentes façon d'ajouter des références au groupe Zotero CLESSN.

- Drag & drop à partir de votre librairie personelle
- Drag & drop les pdf que vous avez sur votre ordinateur dans la collection livre-outils. Zotero va essayer de trouver les métadonnées automatiquement.
- Si il ne réussi pas, vous pourrez ajouter la références en cliquant sur la baguette magique en haut à gauche du symbole " + " vert. L'outil de baguette magique est utile si vous possédez le DOI ou le ISBN de l'article/livre que vous devez ajouter. Dans les rares cas où Zotero ne trouve rien à propos de votre référence, vous pourrez remplir les différents champs manuellement.
- Utiliser le connecteur à l'intérieur de votre fureteur web. Zotero va aussi tenter de télécharger l'article directement et l'inclure dans la collection approprié.

#### Autres raisons d'utiliser Zotero
- Centralisation des pdf
- Autre

## How to contribute

1.  Create a branch
2.  Switch to the branch on your terminal
3.  Commit your changes
4.  Create a pull request
5.  Follow the instructions in the pull request
6.  Merge your pull request

## Render book

To render the book to pdf, in your terminal, run `quarto render` from
the project directory.
