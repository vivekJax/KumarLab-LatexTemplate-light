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

## Tables

The template provides a standardized table format with gray alternating rows, no column seams, and left-aligned cells with hanging indent on wrapped text.

### Standard Table Pattern
```latex
\begin{table}[h!]
\centering
\begin{minipage}{\mytablewidth}
\centering
\sffamily\small
{\setlength{\tabcolsep}{0pt}%
\begin{tabular}{@{}L{3cm}L{2.5cm}L{\dimexpr\mytablewidth-3cm-2.5cm\relax}@{}}
\toprule
\textbf{Col 1} & \textbf{Col 2} & \textbf{Col 3} \\
\midrule
\gr Shaded row & data & data \\
Unshaded row & data & data \\
\gr Shaded row & data & data \\
\bottomrule
\end{tabular}}
\end{minipage}
\caption{Your caption.}
\end{table}
```

**Key points:**
- `L{width}` — left-aligned column with hanging indent on wrap
- `\gr` — gray shading for alternating rows
- `\mytablewidth` — consistent width matching page margins
- Last column width: use `\dimexpr\mytablewidth-<other widths>\relax`
- Set `\tabcolsep` to `0pt` inside a group so row color has no white seams

See `05_supplement.tex` for a working example.

---

## Figure/Table Captions

When using the **Whitman** body font, figure and table captions automatically render in **Whitney** at 9pt for visual contrast. Caption labels (e.g. **Figure 1:**) are bold. This happens automatically — no configuration needed.

---

## Handling Long URLs and Text Overflow

The template automatically breaks long URLs at hyphens. If a paragraph with a URL or long `\texttt{...}` still overflows into the margin, wrap just that paragraph:

```latex
\begin{sloppypar}
Your paragraph with a long \url{https://example.com/very/long/path} here.
\end{sloppypar}
```

This allows slightly looser line-breaking for that paragraph only.

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
