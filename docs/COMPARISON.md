# Template Comparison: Full Paper vs Quick Document

**Created by: Kumar Lab, The Jackson Laboratory**
**GitHub: https://github.com/KumarLabJax/KumarLab-LatexTemplate**

---

## At a Glance

| | `jax_main.tex` (Full Paper) | `jax_simple.tex` (Quick Document) |
|---|---|---|
| **Use case** | Research papers, multi-author work | Short reports, memos, single-author docs |
| **Structure** | Modular — one file per section | Self-contained — everything in one file |
| **Section files** | `01_introduction.tex`, `02_methods.tex`, etc. | None — write sections inline |
| **Collaboration** | Easy — each author edits their own file | Single-file — one person at a time |
| **Style** | `\usepackage[whitney]{jacksonlab}` | Same |
| **Output** | Identical PDF formatting | Identical PDF formatting |

---

## When to Use Each

### Use `jax_main.tex` when:
- Writing a full research paper with standard sections
- Collaborating with co-authors (each person edits their section file)
- Managing a long document where splitting into files helps organization
- Using version control and want clean diffs per section

### Use `jax_simple.tex` when:
- Writing a short report, memo, or letter
- Working alone on a quick document
- You don't need the full Introduction/Methods/Results/Discussion structure
- You want to get started fast with zero setup

---

## Structural Difference

### `jax_main.tex` — pulls in section files
```latex
\begin{document}
  \begin{titlebox}
    % Title page content ...
  \end{titlebox}

  \input{01_introduction}    % separate file
  \input{02_methods}         % separate file
  \input{03_results}         % separate file
  \input{04_discussion}      % separate file
  \input{05_supplement}      % separate file

  \bibliography{references}
\end{document}
```

### `jax_simple.tex` — everything inline
```latex
\begin{document}
  \begin{titlebox}
    % Title page content ...
  \end{titlebox}

  \section{Introduction}
  % Write directly here

  \section{Methods}
  % Write directly here

  \bibliography{references}
\end{document}
```

---

## Shared Features

Both templates provide:
- Same `jacksonlab.sty` formatting package
- Same font options (Whitney / Whitman)
- Same title page layout (grey box, logo, authors, abstract)
- Same compilation process (`xelatex`)
- Same bibliography support (`references.bib`)
