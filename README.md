# Jackson Laboratory Paper Template

**Created by: Kumar Lab, The Jackson Laboratory**
**GitHub: https://github.com/KumarLabJax/KumarLab-LatexTemplate**

**License**: Dual license system (Proprietary + Creative Commons BY-NC-ND 4.0)
**Restrictions**: Jackson Laboratory use only - see LICENSE files for details

---

## Choose Your Template

### `jax_main.tex` — Full Paper (Modular)
- **Best for**: Multi-section research papers, collaborative writing
- **Structure**: Each section in its own file (`01_introduction.tex`, `02_methods.tex`, etc.)
- **Why**: Multiple authors can work on different sections simultaneously

### `jax_simple.tex` — Quick Document (Single File)
- **Best for**: Short reports, memos, single-author documents
- **Structure**: Everything in one file — no external section files needed
- **Why**: Fast to start, nothing to set up, just write

Both templates use `jacksonlab.sty` for formatting, so they look identical in the final PDF.

---

## Quick Start

### 1. Pick your template
- Full paper? Open `jax_main.tex` and edit the section files
- Quick document? Open `jax_simple.tex` and write directly

### 2. Choose your font
```latex
\usepackage[whitney]{jacksonlab}  % Modern, clean serif
\usepackage[whitman]{jacksonlab}  % Traditional, readable serif
```

### 3. Compile
```bash
# Quick compilation
./scripts/compile_simple.sh

# With bibliography
./scripts/compile_with_bibtex.sh

# Or manually
xelatex jax_main.tex
```

### 4. View your PDF
Open `jax_main.pdf` (or `jax_simple.pdf`) to see your paper.

---

## Font Options

| Font | Style | Best For |
|------|-------|----------|
| **Whitney** | Modern, clean serif | Contemporary research papers |
| **Whitman** | Traditional, readable serif | Classic academic publications |

Both options use **DIN Next LT Pro** for headers and titles automatically.

### Font Examples

**Whitney (Modern):**

![Whitney Font Example](figures/font_example_whitney.png)

**Whitman (Traditional):**

![Whitman Font Example](figures/font_example_whitman.png)

---

## What to Edit

### Title Page (in your chosen template)
```latex
% Title
\titletext{Your Title First Line}{Second Line}

% Authors (* = Equal contribution, † = Correspondence, ‡ = Senior author)
{\authorfont First Author*, Second Author†, Third Author‡}

% Institution
{\affiliationfont The Jackson Laboratory \\ 600 Main Street, Bar Harbor, ME 04609, USA}

% Abstract
{\abstractfont Your abstract text here.}
```

### Content

**Full paper** (`jax_main.tex`): Edit the section files:
- `01_introduction.tex` — Introduction
- `02_methods.tex` — Methods
- `03_results.tex` — Results
- `04_discussion.tex` — Discussion
- `05_supplement.tex` — Supplementary materials

**Quick document** (`jax_simple.tex`): Write sections directly in the file.

### References
Add entries to `references.bib`, then cite with `\cite{key}` in your text.

---

## File Structure

```
Your Project/
├── jax_main.tex              # Full paper template (modular)
├── jax_simple.tex            # Quick document template (single file)
├── jacksonlab.sty            # Style package (shared by both templates)
├── 01_introduction.tex       # Introduction (used by jax_main.tex)
├── 02_methods.tex            # Methods (used by jax_main.tex)
├── 03_results.tex            # Results (used by jax_main.tex)
├── 04_discussion.tex         # Discussion (used by jax_main.tex)
├── 05_supplement.tex         # Supplement (used by jax_main.tex)
├── references.bib            # Bibliography
├── figures/                  # Figures folder
│   ├── JAX logo.png
│   └── test_figure.tex
├── Fonts/                    # Font files
│   ├── DIN/                  # DIN Next LT Pro (headers)
│   ├── Whitney/              # Whitney (body text option)
│   └── Whitman/              # Whitman (body text option)
├── scripts/                  # Compilation scripts
│   ├── compile_simple.sh
│   ├── compile_with_bibtex.sh
│   └── watch_latex.sh
└── docs/                     # Documentation
    ├── USER_GUIDE.md
    └── COMPARISON.md
```

---

## Compilation

| Method | Command | When to Use |
|--------|---------|-------------|
| Simple | `./scripts/compile_simple.sh` | Editing text, quick preview |
| Full | `./scripts/compile_with_bibtex.sh` | Added/changed references |
| Watch | `./scripts/watch_latex.sh` | Active writing, auto-recompile on save |
| Manual | `xelatex jax_main.tex` | Direct compilation |

**Requirement**: Must use **XeLaTeX** (not pdfLaTeX) for font support.

---

## Adding Content

### Figures
```latex
\begin{figure}[h]
\centering
\includegraphics[width=0.8\textwidth]{figures/your_figure.png}
\caption{Your figure caption.}
\label{fig:your_figure}
\end{figure}
```

### Tables
```latex
\begin{table}[h]
\centering
\begin{tabular}{lcc}
\toprule
Method & Accuracy & Speed \\
\midrule
Method A & 95\% & Slow \\
Method B & 94\% & Fast \\
\bottomrule
\end{tabular}
\caption{Your table caption.}
\label{tab:your_table}
\end{table}
```

### Citations
Add to `references.bib`:
```bibtex
@article{key,
  title={Title},
  author={Author},
  journal={Journal},
  year={2024}
}
```
Then cite: `\cite{key}`

Run `./scripts/compile_with_bibtex.sh` after adding new references.

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Fonts look wrong | Make sure you're using `xelatex`, not `pdflatex` |
| References show [?] | Run `./scripts/compile_with_bibtex.sh` |
| "spawn xelatex ENOENT" in VS Code | Scripts use full path `/Library/TeX/texbin/xelatex` |
| Permission denied on scripts | Run `chmod +x scripts/*.sh` |
| Style not loading | Make sure `jacksonlab.sty` is in the same folder as your `.tex` file |

---

## VS Code / Cursor Setup

### Recommended Extensions
1. **LaTeX Workshop** — LaTeX support, auto-compilation, PDF preview
2. **BibTeX Language Support** — Syntax highlighting for `.bib` files

### Compile with VS Code
1. Press **F5** or click the play button
2. Select your compilation option
3. PDF is generated automatically

See `docs/USER_GUIDE.md` for detailed instructions.
