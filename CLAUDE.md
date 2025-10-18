# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Quarto book project titled "Outils de recherche en sciences sociales numériques" (Digital Research Tools in Social Sciences), authored by CLESSN (Chaire de leadership en enseignement des sciences sociales numériques). The book is written in French and covers digital tools and methodologies for social science research.

## Building and Rendering

**IMPORTANT**: Always render the complete book using the commands below. Do NOT render individual chapters as this creates unwanted `*_files/` directories at the project root and bypasses the proper book structure.

### Render the book to PDF (RECOMMENDED)
```bash
quarto render
# or explicitly:
quarto render index.qmd --to pdf
```

The output will be generated in the `_book/` directory as specified in `_quarto.yml`.

### Preview the book during development
```bash
quarto preview
```

### Testing changes after editing
After modifying chapters, always render the complete book to verify changes:
```bash
quarto render
```

### WARNING: Do NOT render individual chapters
Rendering individual chapters like `quarto render chapitre_1.qmd --to pdf` will:
- Create unwanted `chapitre_X_files/` directories in the project root
- Bypass the book's centralized resource management
- Produce standalone PDFs instead of integrated book chapters

If you need to test a specific chapter, render the complete book instead.

## Project Structure

### Content Organization
- **index.qmd**: Front matter (avant-propos) introducing big data and causality in social sciences
- **chapitre_1.qmd** to **chapitre_8.qmd**: Main chapters covering topics including:
  - Chapter 1: Free and open-source software philosophy
  - Chapter 3: Agile methodology for academic workflows
  - Other chapters covering various digital research tools
- **conclusion.qmd**: Concluding chapter
- **annexe_1.qmd**: Appendix
- **references.qmd**: Bibliography page

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

## Bibliography Management with Zotero

The project uses Zotero for reference management:

1. **Zotero Setup**: Team members use a shared Zotero group library called "CLESSN"
2. **Better BibTeX**: The bibliography file is auto-generated and kept in sync using Better BibTeX
3. **Citation Key Format**: `authEtal2.fold.lower.replace(find=".",replace=_) + len + shortyear | veryshorttitle + shortyear`
4. **File Location**: Export the "livre-outils" collection to `livre-outils.bib` in the project root with "Keep updated" enabled
5. **In-text Citations**: Use `@` in the editor to trigger the citation palette

When modifying bibliography:
- Changes in Zotero automatically sync to the group library and propagate to the .bib file
- Be careful: deletions affect all team members
- Add references via drag-and-drop, magic wand tool (DOI/ISBN), or browser connector

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
