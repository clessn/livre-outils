
<!-- README.md is generated from README.Rmd. Please edit that file -->


<!-- badges: start -->
<!-- badges: end -->

# Propositions de modifications :

1er PR : porte sur le chapitre 1 : Proposition d'ajouter des exemples plus concrets d'outils et méthodes qui dépassent le cadre quotidien et qui s'intégreraient et s'appliqueraient aux sciences sociales (ou plus précisément aux sciences politiques) avec par exemple un nom d'outil et le nom de la méthode qu'il permettrait (inversement) (par exemple R à utiliser pour l'analyse de contenu de tweets). Les propositions ont été faites aux lignes 14 et 18 du fichier qmd sur R. Sinon ajout général d'exemples entre parenthèses quand on parle de logiciel libre. J'ai conscience que le reste du livre le fait mais j'imagine que cela resterait pertinent étant donné que le chapitre 1 introduit les concepts et qu'il est bien d'y être familiarisé avec des choses plus concrètes.

2ème PR : porte sur le chapitre 3 : Proposition d’ajouter un court passage (quelques phrases ou un paragraphe) pour attirer l’attention sur les risques liés à une utilisation trop dépendante d’outils comme Notion et plus généralement du cloud. Il serait pertinent de sensibiliser sur l'importance des enjeux de confidentialité et de protection des données (données stockées sur Notion sont hébergées aux États-Unis et donc potentiellement accessibles par le Cloud Act et du Patriot Act). + Recommandation aux lecteurs de vérifier si les outils qu’ils utilisent sont conformes aux politiques de leur institution (lignes 338 et 339 du fichier qmd sur R).

3ème PR : porte sur le chapitre 2 : Proposition d'ajouter un passage mentionnant les ressources informelles telles que YouTube ou les ressources universitaires (ateliers des bibliothèques universitaires, livres disponibles à l'emprunter) dans la section sur l’apprentissage des langages de programmation (avantage d'être gratuit et permet un apprentissage qui intègre des méthodes diverses et variées) (lignes 56 et 57 du fichier qmd sur R).

4ème PR : porte sur le chapitre 5 : Proposition d'ajouter une phrase ou deux soulignant l’importance (notamment pour les étudiants) de savoir produire une bibliographie sans dépendre entièrement d’un logiciel. Malgré le gain de temps considérable que représentent Zotero ou Mendeley des problèmes techniques peuvent survenir. Il reste utile de maîtriser de manière autonome les bases des styles de citation pour conserver autonomie, cohérence et rigueur. De plus, cela permettrait d'optimiser l'utilisation de Mendeley et Zotero.

# Comment contribuer au projet du livre d'outils

Bienvenue ! Ce guide vous aidera à contribuer à notre projet de livre hébergé sur GitHub. Ne vous inquiétez pas si vous êtes nouveau sur Git ou GitHub ; ce guide étape par étape est conçu pour les débutants ayant une expérience technique limitée.

## Table des matières

1. [Prérequis](#prérequis)
2. [Installation de Git](#installation-de-git)
3. [Forker le dépôt](#forker-le-dépôt)
4. [Cloner votre fork](#cloner-votre-fork)
5. [Apporter des modifications localement](#apporter-des-modifications-localement)
6. [Valider vos modifications](#valider-vos-modifications)
7. [Pousser les modifications sur GitHub](#pousser-les-modifications-sur-github)
8. [Créer une Pull Request](#créer-une-pull-request)
9. [Compiler le livre complet](#compiler-le-livre-complet)
10. [À propos du fichier .gitignore](#à-propos-du-fichier-gitignore)
11. [Gestion de la bibliographie avec Zotero](#gestion-de-la-bibliographie-avec-zotero)
12. [Étapes suivantes](#étapes-suivantes)

---

## Prérequis

- **Git** : Un système de contrôle de version que nous utiliserons pour gérer les modifications.
- **Compte GitHub** : Si vous n'en avez pas, vous pouvez vous inscrire sur [github.com](https://github.com).
- **Éditeur de texte** : Tout éditeur de texte simple comme Notepad, TextEdit, ou des éditeurs plus avancés comme Visual Studio Code.

## Installation de Git

### Installer Git

- **Windows** : Téléchargez et installez depuis [git-scm.com/download/win](https://git-scm.com/download/win).
- **macOS** : Téléchargez et installez depuis [git-scm.com/download/mac](https://git-scm.com/download/mac).
- **Linux** : Installez via votre gestionnaire de paquets, par exemple, `sudo apt-get install git`.

### Vérifier l'installation

Ouvrez votre invite de commande ou terminal et tapez :

```bash
git --version
```

Vous devriez voir la version de Git installée.

## Forker le dépôt

1. Accédez au [dépôt du livre](https://github.com/clessn/livre-outils).
2. Cliquez sur le bouton **Fork** dans le coin supérieur droit de la page.
3. Cela crée une copie du dépôt sous votre compte GitHub.

## Cloner votre fork

1. Naviguez vers votre dépôt forké sur GitHub (il devrait être `github.com/VOTRE-NOM-D'UTILISATEUR/livre-outils`).
2. Cliquez sur le bouton **Code** et copiez l'URL.
3. Ouvrez votre invite de commande ou terminal.
4. Naviguez vers le répertoire où vous souhaitez stocker le projet, par exemple :

   ```bash
   cd Documents
   ```

5. Clonez votre dépôt forké :

   ```bash
   git clone https://github.com/VOTRE-NOM-D'UTILISATEUR/livre-outils.git
   ```

   Remplacez `VOTRE-NOM-D'UTILISATEUR` par votre nom d'utilisateur GitHub.

## Apporter des modifications localement

1. Accédez au dossier du projet :

   ```bash
   cd livre-outils
   ```

2. Ouvrez le fichier que vous souhaitez modifier à l'aide de votre éditeur de texte. Par exemple :

   - **Utiliser RStudio** :

     ```bash
     rstudio chapitre_1.qmd
     ```
     
3. Apportez vos modifications et enregistrez le fichier.

## Valider vos modifications

1. Revenez à votre invite de commande ou terminal.
2. Vérifiez l'état de vos modifications :

   ```bash
   git status
   ```

3. Ajoutez vos modifications pour les valider :

   ```bash
   git add chapitre_1.qmd
   ```

4. Validez vos modifications avec un message :

   ```bash
   git commit -m "Correction des fautes de frappe dans le chapitre 1"
   ```

## Pousser les modifications sur GitHub

Envoyez vos modifications validées vers votre dépôt GitHub :

```bash
git push origin main
```

Si vous obtenez une erreur concernant la branche inexistante, vous devrez peut-être définir la branche distante :

```bash
git push --set-upstream origin main
```

## Créer une Pull Request

1. Allez sur votre dépôt forké sur GitHub.

2. Cliquez sur l'onglet **Pull Requests**.

3. Cliquez sur **New Pull Request**.

4. Assurez-vous que vous comparez votre branche `main` à la branche `main` du dépôt original.

5. Cliquez sur **Create Pull Request**.

6. Ajoutez un titre descriptif et un commentaire sur vos modifications.

7. Cliquez à nouveau sur **Create Pull Request** pour soumettre.

## Compiler le livre complet

### Pourquoi compiler le livre complet ?

Ce projet est un **livre Quarto**, pas une collection de documents indépendants. Il est essentiel de toujours compiler le livre dans son ensemble et **jamais** les chapitres individuellement.

### La commande à utiliser

Pour compiler le livre en PDF, ouvrez votre terminal dans le dossier du projet et exécutez :

```bash
quarto render index.qmd --to pdf
```

Ou simplement :

```bash
quarto render
```

Le PDF final sera généré dans le dossier `_book/`.

**⚠️ NE PAS compiler les chapitres individuellement !**

### Prévisualiser pendant l'édition

Pour voir vos modifications en temps réel pendant que vous éditez :

```bash
quarto preview
```

Cela ouvre le livre dans votre navigateur et se met à jour automatiquement quand vous sauvegardez vos changements.

## À propos du fichier .gitignore

### Qu'est-ce que le .gitignore ?

Le fichier `.gitignore` indique à Git quels fichiers et dossiers **ne doivent pas** être suivis dans le dépôt. Cela garde le projet propre et évite de partager des fichiers inutiles ou problématiques.

### Ce qui est ignoré dans ce projet

Le `.gitignore` est configuré pour exclure :

- **`_book/`** : Le dossier contenant le PDF compilé (peut être regénéré)
- **`.quarto/`** : Cache interne de Quarto
- **`*_files/` et `*_cache/`** : Dossiers créés par erreur lors de rendus de chapitres individuels
- **Fichiers LaTeX temporaires** : `.aux`, `.log`, `.toc`, `.out`, etc.
- **Fichiers système** : `.DS_Store` (macOS), `Thumbs.db` (Windows)
- **Fichiers Office temporaires** : `~$*.docx`, `~$*.xlsx`, etc.

## Gestion de la bibliographie avec Zotero

**Cette section explique comment gérer les références bibliographiques du livre.** Toutes les citations dans le texte (format `@auteur_annee`) sont automatiquement compilées en une bibliographie à la fin du livre. La source unique de vérité pour toutes les références est la bibliothèque de groupe Zotero **CLESSN**, qui est automatiquement exportée vers le fichier `livre-outils.bib`.

### Installation et configuration de Zotero

Dans cette section, vous serez amené à installer Zotero ainsi que Better BibTeX, une extension de Zotero servant à générer et maintenir à jour des fichiers .bib à partir de Zotero.

#### Zotero

- Installer [Zotero](https://www.zotero.org/download/)
- Installer [Zotero Connector](https://www.zotero.org/download/)

- Une fois Zotero installé, créer un [compte Zotero](https://www.zotero.org/user/register/). Prenez note de votre identifiant et partagez-le avec Laurence-Olivier pour qu'il vous ajoute sur le groupe Zotero CLESSN.

- Allez dans vos courriels et suivez les directives pour joindre le groupe Zotero CLESSN.

#### Better BibTeX

- La prochaine étape sera d'installer [Better BibTeX](https://retorque.re/zotero-better-bibtex/installation/). Pour ce faire, allez dans l'onglet tools > Add-ons ensuite cliquez sur l'icône de paramètre et faites Install Add-on From File. Sélectionnez le fichier .xpi que vous avez téléchargé.

*IMPORTANT*

- Une fois l'add-on installé, allez dans les paramètres de Better BibTeX en allant dans l'onglet Zotero > Settings > Onglet Better BibTeX > Open Better BibTeX preferences...

- Dans la section Citation Key Format, collez ceci: `authEtal2.fold.lower.replace(find=".",replace=_) + len + shortyear | veryshorttitle + shortyear`

#### Génération du fichier .bib

Dans Zotero, vous devriez maintenant voir le groupe Zotero CLESSN dans les Group Libraries.

*Il est important de comprendre que tout changement que vous faites dans Zotero sera automatiquement synchronisé avec le groupe Zotero CLESSN. Si vous supprimez une référence, elle sera supprimée pour tout le monde!*

Clic-droit sur la collection livre-outils > Export Collection, choisissez le format Better BibLaTeX et cochez la case [x] Keep updated. Faites OK et sauvegardez le fichier dans le repo du projet livre-outils. Ce dossier sera constamment mis à jour avec les changements que vous faites dans Zotero et sera synchronisé avec le projet GitHub quand vous ferez vos pull requests.

Vous remarquerez qu'il y a déjà un fichier .bib dans le dossier. Vous pouvez le supprimer et le remplacer par le fichier que vous venez de générer.

#### Utilisation de Zotero lors de l'écriture

Lors de l'écriture, vous n'avez qu'à écrire @ dans votre éditeur pour faire sortir la palette de référencement.

#### Ajouter des références à Zotero

Il y a différentes façons d'ajouter des références au groupe Zotero CLESSN.

- Drag & drop à partir de votre librairie personnelle
- Drag & drop les PDF que vous avez sur votre ordinateur dans la collection livre-outils. Zotero va essayer de trouver les métadonnées automatiquement.
- Si il ne réussit pas, vous pourrez ajouter la référence en cliquant sur la baguette magique en haut à gauche du symbole " + " vert. L'outil de baguette magique est utile si vous possédez le DOI ou le ISBN de l'article/livre que vous devez ajouter. Dans les rares cas où Zotero ne trouve rien à propos de votre référence, vous pourrez remplir les différents champs manuellement.
- Utiliser le connecteur à l'intérieur de votre fureteur web. Zotero va aussi tenter de télécharger l'article directement et l'inclure dans la collection appropriée.

#### Autres avantages de Zotero
- Centralisation des PDFs
- Organisation des lectures par projet
- Annotations et notes directement dans Zotero
- Recherche rapide dans votre bibliothèque

## Étapes suivantes

- **Attendre la revue** : Les mainteneurs du projet examineront vos modifications. Ils peuvent poser des questions ou demander des ajustements.
- **Répondre aux commentaires** : Si des modifications sont demandées, apportez-les localement, validez, poussez, et elles seront automatiquement mises à jour dans votre pull request.
- **Restez engagé** : N'hésitez pas à contribuer davantage ou à poser des questions si vous avez des doutes.

---

## Besoin d'aide ?

Si vous rencontrez des problèmes ou avez des questions, veuillez contacter les mainteneurs du projet ou demander pendant le cours. Nous sommes là pour vous aider à apprendre et à contribuer !

# Ressources supplémentaires

- [Guides GitHub](https://guides.github.com/activities/hello-world/)
- [Vidéos sur les bases de Git](https://www.youtube.com/watch?v=HVsySz-h9r4)

---

Merci pour votre contribution !


