# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Table of Contents

1. [Project Overview](#project-overview)
2. [How to Compile the Book](#how-to-compile-the-book)
3. [Project Structure](#project-structure)
4. [Bibliography Management with Zotero](#bibliography-management-with-zotero)
5. [Git and Version Control](#git-and-version-control)
6. [Collaboration Workflow](#collaboration-workflow)
7. [Writing Guidelines](#writing-guidelines)
8. [Common Tasks](#common-tasks)

## Project Overview

This is a Quarto book project titled "Outils de recherche en sciences sociales numériques" (Digital Research Tools in Social Sciences), authored by CLESSN (Chaire de leadership en enseignement des sciences sociales numériques). The book is written in French and covers digital tools and methodologies for social science research.

## How to Compile the Book

### The Correct Way: Compile via `index.qmd`

**IMPORTANT**: Always render the complete book by targeting `index.qmd`. This is the entry point that Quarto uses to orchestrate the entire book compilation.

```bash
# Recommended command from terminal:
quarto render index.qmd --to pdf
```

Or simply:
```bash
quarto render
```

**Why compile through `index.qmd` and not individual chapters?**

1. **Book Structure**: Quarto treats this as a book project (defined in `_quarto.yml`). The `index.qmd` file serves as the front matter and triggers the complete book build process.

2. **Centralized Resource Management**: When compiling through `index.qmd`:
   - All chapters are processed in the correct order
   - Cross-references between chapters work properly (`@sec-chapX`)
   - The bibliography (`livre-outils.bib`) is compiled once for the entire book
   - Images and resources are managed centrally in the `images/` directory
   - Output goes to the `_book/` directory as configured

3. **Avoid Pollution**: Compiling individual chapters (e.g., `quarto render chapitre_1.qmd`) creates:
   - Unwanted `chapitre_X_files/` directories at the project root
   - Standalone PDFs that don't integrate with the book structure
   - Duplicate resource processing and broken cross-references

### Output Location

The compiled PDF will be generated in:
```
_book/Outils-de-recherche-en-sciences-sociales-numériques.pdf
```

### Preview During Development

To preview the book in your browser while editing:
```bash
quarto preview
```

This starts a local server and automatically refreshes when you save changes to `.qmd` files.

### Testing Changes

After modifying any chapter, always render the complete book to verify:
- Cross-references still work
- Bibliography citations are correct
- Images display properly
- Table of contents is updated

### Important Note for Claude Code

**CRITICAL - DO NOT RENDER THE BOOK YOURSELF**: This project is stored in Dropbox, which **ALWAYS creates sync conflicts and temporary files** when Claude Code renders the book, even with a simple command.

**⚠️ MANDATORY POLICY - User Must Render ⚠️**:

When a user asks to:
- "Verify compilation"
- "Check for errors"
- "Render the book"
- "See if it compiles"
- Any variation of these requests

**YOUR FIRST RESPONSE MUST BE**:
```
Il est préférable que vous exécutiez cette commande dans votre terminal pour éviter des conflits Dropbox et des fichiers temporaires :

quarto render index.qmd --to pdf

Cela vous donnera les warnings et erreurs directement sans polluer le repository.
```

**Why Claude Code MUST NOT Render**:
Even with the simplest command (`quarto render index.qmd --to pdf`), the Bash tool execution context causes:
1. **Dropbox sync conflicts**: Creates files like `index (Copie en conflit de Adrien Cloutier 2025-10-19).pdf`
2. **Leftover auxiliary files**: `index.aux`, `index.log`, sometimes `index.tex`
3. **Process timing issues**: Dropbox sees concurrent writes from the render process
4. **Repository pollution**: Extra cleanup steps always required

**When the User Explicitly Says "render stp" or Similar**:

Only if the user explicitly insists (e.g., "render stp", "fais-le toi-même"), then proceed but follow this protocol:

1. **Render with simple command**:
   ```bash
   quarto render index.qmd --to pdf
   ```

2. **NEVER use**:
   - `| tee output.log`
   - `> output.log`
   - Any redirection or pipe that creates files

3. **MANDATORY cleanup after render** (success OR failure):
   ```bash
   rm -f index.aux index.log index.tex "index (Copie en conflit de "*.pdf "index (Copie en conflit de "*.aux
   ```

4. **VERIFY repository is clean**:
   ```bash
   git status --short
   ```
   If ANY unexpected files remain (`index.*` except `index.qmd`, or "Copie en conflit"), remove them immediately.

5. **If cleanup fails**: Explicitly tell the user what files remain and ask them to delete manually.

**Example Interaction**:

```
User: "Peux-tu vérifier si le livre compile correctement?"
Claude: "Il est préférable que vous exécutiez `quarto render index.qmd --to pdf`
         dans votre terminal pour éviter des conflits Dropbox et des fichiers temporaires."

User: "Non, fais-le toi"
Claude: [Renders] [Cleans up] [Verifies with git status]
```

**DO NOT**:
- Render proactively to "check" something
- Render just to see warnings
- Render to answer questions about citations or errors
- Instead: Ask user to run the command and share the output if needed

## Project Structure

### Content Organization

- **index.qmd**: Front matter (avant-propos) introducing big data and causality in social sciences
- **chapitre_1.qmd**: Free and open-source software philosophy
- **chapitre_2.qmd**: [Chapter 2 topic]
- **chapitre_3.qmd**: Outils de gestion de projet (Agile methodology for academic workflows)
- **chapitre_4.qmd**: Outils de gestion de données (data management tools)
- **chapitre_5.qmd**: Outils de synthèses de la connaissance et gestion des références (Zotero)
- **chapitre_6.qmd**: Outils de collecte de données (data collection tools)
- **chapitre_7.qmd**: Outils de visualisation graphique (data visualization)
- **chapitre_8.qmd**: Outils de rédaction - langages de balisage (LaTeX, Markdown)
- **chapitre_9.qmd**: Outils d'intelligence artificielle (AI tools for research)
- **conclusion.qmd**: Concluding chapter
- **annexe_1.qmd**: Appendix
- **references.qmd**: Bibliography page (automatically generated from citations)

### Configuration Files
- **_quarto.yml**: Main Quarto configuration file defining:
  - Book metadata (title, author, date)
  - Chapter order and structure
  - PDF output settings with French language support
  - Bibliography settings using `livre-outils.bib` with APA style from Zotero

### Supporting Files
- **livre-outils.bib**: BibTeX bibliography file (managed via Zotero with Better BibTeX)
- **images/**: Directory containing figures and images referenced in chapters
- **data/**: Contains data files (e.g., titanic.csv)
- **R/**: Directory containing R scripts used by chapters (e.g., `graphique.R` for Chapter 8)
- **.gitignore**: Specifies which files and directories Git should ignore (see [Git and Version Control](#git-and-version-control))

## Bibliography Management with Zotero

**Purpose**: This section explains how the book's bibliography is managed. All citations in the book (formatted as `@author_year` in the `.qmd` files) are automatically compiled into a bibliography at the end of the book. The source of truth for all references is a Zotero group library, which is automatically exported to the `livre-outils.bib` file.

### Workflow Overview

The project uses Zotero as the centralized reference management system:

1. **Zotero Setup**: Team members use a shared Zotero group library called "CLESSN"
2. **Better BibTeX**: The bibliography file is auto-generated and kept in sync using Better BibTeX
3. **Citation Key Format**: `authEtal2.fold.lower.replace(find=".",replace=_) + len + shortyear | veryshorttitle + shortyear`
4. **File Location**: Export the "livre-outils" collection to `livre-outils.bib` in the project root with "Keep updated" enabled
5. **In-text Citations**: Use `@` in the editor to trigger the citation palette

When modifying bibliography:
- Changes in Zotero automatically sync to the group library and propagate to the .bib file
- Be careful: deletions affect all team members
- Add references via drag-and-drop, magic wand tool (DOI/ISBN), or browser connector

## Git and Version Control

### The `.gitignore` File

**Purpose**: The `.gitignore` file tells Git which files and directories should **not** be tracked or committed to the repository. This is crucial for keeping the repository clean and avoiding unnecessary or problematic files.

### What is Ignored in This Project

The `.gitignore` is configured to exclude:

1. **Build Artifacts and Temporary Files**:
   - `_book/` - The compiled PDF output directory
   - `.quarto/` - Quarto's internal cache and processing files
   - `*_files/` - Chapter-specific resource directories (created when rendering individual chapters incorrectly)
   - `*_cache/` - Cached computation results

2. **LaTeX Auxiliary Files**:
   - `.aux`, `.log`, `.toc`, `.out`, `.synctex.gz`, etc.
   - These are generated during PDF compilation and can be regenerated

3. **System Files**:
   - `.DS_Store` (macOS)
   - `Thumbs.db`, `Desktop.ini` (Windows)
   - These are OS-specific files that don't belong in version control

4. **Office Document Temporary Files**:
   - `~$*.docx`, `~$*.xlsx`, etc.
   - Created by Microsoft Office when files are open

### Why This Matters

- **Cleaner Repository**: Only source files (`.qmd`, `.bib`, images, data) are tracked
- **Avoid Conflicts**: Build artifacts can differ between machines and cause merge conflicts
- **Smaller Repo Size**: Excluding generated files keeps the repository lightweight
- **Reproducibility**: Anyone can clone the repo and run `quarto render` to get the same output

### What IS Tracked

The following are tracked in Git:
- All `.qmd` source files
- `_quarto.yml` configuration
- `livre-outils.bib` bibliography
- Images in `images/`
- Data files in `data/`
- R scripts in `R/`
- `CLAUDE.md` and `.gitignore` itself

## Collaboration Workflow

This project follows a fork-and-pull-request workflow:

1. **Fork** the repository from https://github.com/clessn/livre-outils
2. **Clone** your fork locally
3. **Make changes** to .qmd files using RStudio or any text editor
4. **Commit** changes with descriptive messages (in French)
5. **Push** to your fork on GitHub
6. **Create a Pull Request** to the main repository

### Git Commands for Contributors
```bash
# Check status
git status

# Stage changes
git add chapitre_1.qmd

# Commit with message
git commit -m "Correction des fautes de frappe dans le chapitre 1"

# Push to GitHub
git push origin main
```

### Important Note for Claude Code (Commits)

**Ne JAMAIS ajouter de "Co-Authored-By" dans les messages de commit.** Les commits appartiennent aux auteurs du projet, pas à Claude. Les messages de commit doivent être simples et descriptifs, sans mention de l'assistant IA.

## Writing Guidelines

### LaTeX in Quarto
Chapters use LaTeX commands for special formatting:
- Author footnotes: `\footnotetext[1]{Institution}`
- Centered content: `\begin{center} ... \end{center}`
- Text formatting: `\textit{...}` for italics

### Citations
Use standard Quarto/Pandoc citation syntax: `[@author_year]` or `@author_year`

### Chapter Structure
Each chapter typically includes:
- Chapter title with label: `# Title {#sec-chapX}`
- Author information using LaTeX footnotes
- Introduction and conceptual framework
- Practical examples and use cases
- Tables and figures from the `images/` directory

## Output Configuration

The PDF output is configured for:
- **Language**: French (`lang: fr`)
- **Margins**: 30mm on all sides
- **Page layout**: One-sided (`oneside` class option)
- **Citation style**: APA via Zotero CSL
- **Packages**: Includes `setspace` and `csquotes` for proper formatting

## Development Notes

- The project is stored in Dropbox: `/Users/adrien/Library/CloudStorage/Dropbox/travail/universite_laval/publications/livre-outils`
- Editor preference is set to "source" mode in `_quarto.yml`
- The `.quarto/` directory contains cached renders and can be ignored
- Main branch for pull requests: `main`

## Common Tasks

### Add a new chapter
1. Create `chapitre_X.qmd` in the root directory
2. Add to the `chapters:` list in `_quarto.yml`
3. Follow existing chapter structure for consistency

### Update images
1. Place images in the `images/` directory
2. Reference using relative paths: `![description](images/filename.png)`

### Fix rendering errors
1. Check for LaTeX syntax errors in .qmd files
2. Ensure all referenced images exist
3. Verify bibliography citations match entries in `livre-outils.bib`
4. Use `quarto check` to diagnose issues
