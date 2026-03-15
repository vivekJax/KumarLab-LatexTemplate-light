# Scripts Documentation

This folder contains scripts to compile your LaTeX documents. No programming knowledge required.

---

## Available Scripts

### `compile_simple.sh` — Quick Compilation
Compiles your document in one step. Use when editing text or making formatting changes.

```bash
./scripts/compile_simple.sh
```

**What it does:** Runs `xelatex jax_main.tex` and creates `jax_main.pdf`.

---

### `compile_with_bibtex.sh` — Full Compilation
Compiles with complete bibliography processing. Use when you've added or changed references.

```bash
./scripts/compile_with_bibtex.sh
```

**What it does:**
1. First XeLaTeX pass (creates basic PDF)
2. BibTeX pass (processes references)
3. Second XeLaTeX pass (inserts references)
4. Final XeLaTeX pass (resolves cross-references)

---

### `watch_latex.sh` — Auto-Compile Mode
Watches your file and recompiles automatically whenever you save. Use during active writing.

```bash
./scripts/watch_latex.sh
```

Press **Ctrl+C** to stop.

**Requires:** `entr` (file watcher utility). Install with `brew install entr` if needed.

---

## Which Script Should I Use?

| Situation | Script |
|-----------|--------|
| Active writing, want instant feedback | `watch_latex.sh` |
| Quick check after small edits | `compile_simple.sh` |
| Added new references or final version | `compile_with_bibtex.sh` |

---

## How to Run

### Terminal
```bash
cd /path/to/your/project
./scripts/compile_simple.sh
```

### VS Code / Cursor
1. Open Terminal (Terminal > New Terminal)
2. Run your chosen script

### Permission Denied?
```bash
chmod +x scripts/*.sh
```

---

## Compiling `jax_simple.tex`

The scripts compile `jax_main.tex` by default. To compile `jax_simple.tex` instead, run manually:

```bash
xelatex jax_simple.tex
```

Or for full compilation with bibliography:
```bash
xelatex jax_simple.tex && bibtex jax_simple && xelatex jax_simple.tex && xelatex jax_simple.tex
```

---

## Troubleshooting

- **"Permission denied"**: Run `chmod +x scripts/*.sh`
- **"Command not found"**: Make sure you're in the project root folder
- **Script doesn't work**: Check that XeLaTeX is installed and `jax_main.tex` exists
- **References missing**: Use `compile_with_bibtex.sh` instead of `compile_simple.sh`
