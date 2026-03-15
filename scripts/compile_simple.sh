#!/bin/bash

# Simple compilation script for VS Code tasks
# Runs bibtex automatically if a .bib file is referenced
TEX_FILE="${1:-jax_main.tex}"
BASE="${TEX_FILE%.tex}"

echo "Compiling $TEX_FILE..."
/Library/TeX/texbin/xelatex -interaction=nonstopmode "$TEX_FILE" > /dev/null 2>&1

# Run bibtex if the document uses \bibliography and no .bbl exists yet
if grep -q '\\bibliography{' "$TEX_FILE" 2>/dev/null && [ ! -f "${BASE}.bbl" ]; then
    echo "Running BibTeX..."
    /Library/TeX/texbin/bibtex "$BASE" > /dev/null 2>&1
    /Library/TeX/texbin/xelatex -interaction=nonstopmode "$TEX_FILE" > /dev/null 2>&1
fi

# Final pass (visible output)
/Library/TeX/texbin/xelatex -interaction=nonstopmode "$TEX_FILE"

if [ $? -eq 0 ]; then
    echo "✅ Compilation successful! Check ${BASE}.pdf"
else
    echo "❌ Compilation failed. Check the output above for errors."
fi
