# Jackson Lab LaTeX Template - User Guide

**Created by: Kumar Lab, The Jackson Laboratory**
**GitHub: https://github.com/KumarLabJax/KumarLab-LatexTemplate**

---

## Two Templates, Two Use Cases

### `jax_main.tex` — Full Paper (Modular)
Each section lives in its own file. Use this for research papers where multiple people may collaborate.

```latex
\documentclass[11pt,onecolumn]{article}
\usepackage[whitney]{jacksonlab}  % or [whitman] for traditional font
\begin{document}
  % Title page ...
  \input{01_introduction}
  \input{02_methods}
  \input{03_results}
  \input{04_discussion}
  \input{05_supplement}
\end{document}
```

**Edit these files for content:**
- `01_introduction.tex`
- `02_methods.tex`
- `03_results.tex`
- `04_discussion.tex`
- `05_supplement.tex`

### `jax_simple.tex` — Quick Document (Single File)
Everything in one file. Use this for short reports, memos, or any document that doesn't need the full modular structure.

```latex
\documentclass[11pt,onecolumn]{article}
\usepackage[whitney]{jacksonlab}
\begin{document}
  % Title page ...
  \section{Introduction}
  % Write directly here
  \section{Methods}
  % Write directly here
\end{document}
```

---

## File Structure

```
Your Project/
├── jax_main.tex              # Full paper template (modular)
├── jax_simple.tex            # Quick document template (single file)
├── jacksonlab.sty            # Style package
├── 01_introduction.tex       # Section files (for jax_main.tex)
├── 02_methods.tex
├── 03_results.tex
├── 04_discussion.tex
├── 05_supplement.tex
├── references.bib            # Bibliography
├── figures/                  # Figures and images
├── Fonts/                    # Font files (DIN, Whitney, Whitman)
└── scripts/                  # Compilation scripts
```

---

## Font Switching

Switch fonts by changing the package option:

```latex
\usepackage[whitney]{jacksonlab}  % Modern serif
\usepackage[whitman]{jacksonlab}  % Traditional serif
```

**DIN Next LT Pro** is always used for headers and titles regardless of font choice.

---

## What to Edit

### Title
```latex
\titletext{Your Paper Title}{Second Line if Needed}
```

### Authors
```latex
{\authorfont
Your Name*,
Co-Author Name*†,
Another Author,
\\ Senior Author‡}
```

**Symbols**: `*` Equal contribution, `†` Correspondence, `‡` Senior author, `§` Additional

### Institution
```latex
{\affiliationfont Your Institution \\ Your Address}
```

### Abstract
```latex
{\abstractfont Your actual abstract text here.}
```

### Metadata
```latex
{\metadatalabelfont Code:} {\metadatatextfont\href{https://github.com/your-repo}{https://github.com/your-repo}} \\
{\metadatalabelfont Correspondence:} {\metadatatextfont{\color{blue}\href{mailto:your-email@jax.org}{your-email@jax.org}}} \\
{\metadatalabelfont Date:} {\metadatatextfont \today}
```

---

## Compilation

### Simple (no bibliography updates)
```bash
./scripts/compile_simple.sh
```

### Full (with bibliography)
```bash
./scripts/compile_with_bibtex.sh
```

### Watch mode (auto-recompile on save)
```bash
./scripts/watch_latex.sh
```

### Manual
```bash
xelatex jax_main.tex
```

---

## Customization

### Font Sizes
Edit `jacksonlab.sty`:
```latex
\newcommand{\titlefont}{\fontsize{20}{28}\selectfont\bfseries\smartfont}
% Change 20 to 18 (smaller) or 22 (larger)
```

### Title Box Colors
Edit `jacksonlab.sty`:
```latex
\newtcolorbox{titlebox}{
    colback=gray!10,  % Change to white, blue!10, etc.
```

### Spacing
Edit `jacksonlab.sty`:
```latex
\newcommand{\titletext}[2]{%
    {\titlefont\raggedright #1 \\[0.1in] #2}%
}
% Change 0.1in to 0.05in (tighter) or 0.2in (looser)
```

---

## Troubleshooting

**Fonts not working:**
- Make sure you're using `xelatex` (not `pdflatex`)
- Check that font files are in the `Fonts/` folder

**Compilation errors:**
- Use the scripts in the `scripts/` folder
- Make sure all files are in the same directory

**References showing [?]:**
- Run `./scripts/compile_with_bibtex.sh`

**Style not loading:**
- Make sure `jacksonlab.sty` is in the same folder as your `.tex` file
