
<!-- README.md is generated from README.Rmd. Please edit that file -->


<!-- badges: start -->
<!-- badges: end -->

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
9. [Étapes suivantes](#étapes-suivantes)

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

   ![Bouton Fork](https://docs.github.com/assets/images/help/repository/fork_button.jpg)

3. Cela crée une copie du dépôt sous votre compte GitHub.

## Cloner votre fork

1. Naviguez vers votre dépôt forké sur GitHub (il devrait être `github.com/VOTRE-NOM-D'UTILISATEUR/livre-outils`).
2. Cliquez sur le bouton **Code** et copiez l'URL.

   ![Bouton Clone](https://docs.github.com/assets/images/help/repository/clone-repo-clone-url-button.png)

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

   - **Utiliser Notepad (Windows)** :

     ```bash
     notepad chapter1.md
     ```

   - **Utiliser TextEdit (macOS)** :

     ```bash
     open -e chapter1.md
     ```

   - **Utiliser Visual Studio Code** :

     ```bash
     code chapter1.md
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
   git add .
   ```

4. Validez vos modifications avec un message :

   ```bash
   git commit -m "Brève description de vos modifications"
   ```

   Exemple :

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

   ![Onglet Pull Requests](https://docs.github.com/assets/images/help/pull_requests/pull-requests-tab.png)

3. Cliquez sur **New Pull Request**.

   ![Bouton New Pull Request](https://docs.github.com/assets/images/help/pull_requests/pull-request-start-review-button.png)

4. Assurez-vous que vous comparez votre branche `main` à la branche `main` du dépôt original.

5. Cliquez sur **Create Pull Request**.

6. Ajoutez un titre descriptif et un commentaire sur vos modifications.

7. Cliquez à nouveau sur **Create Pull Request** pour soumettre.

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

## Getting started

## À propos de Zotero

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

Clic-droit sur la collection livre-outils > Export Collection choisissez le format Better BibLaTex et cochez la case [x] Keep updated. Faites OK et sauvegardez le fichier dans le repo du projet livre-outils. Ce dossier sera constamment mis à jour avec les changements que vous faites dans Zotero et sera synchronisé avec le projet Github quand vous ferez vos pull requests.

Vous remarquerez qu'il y a déjà un fichier .bib dans le dossier. Vous pouvez le supprimer et le remplacer par le fichier que vous venez de générer.

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
