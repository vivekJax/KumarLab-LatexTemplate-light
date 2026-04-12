#!/bin/bash

# Complete compilation script with BibTeX support
echo "Compiling LaTeX document with bibliography..."
echo ""

# Step 1: First XeLaTeX compilation
echo "Step 1: First XeLaTeX compilation..."
xelatex jax_main.tex

# Step 2: Run BibTeX
echo ""
echo "Step 2: Processing bibliography with BibTeX..."
bibtex jax_main

# Step 3: Second XeLaTeX compilation
echo ""
echo "Step 3: Second XeLaTeX compilation..."
xelatex jax_main.tex

# Step 4: Final XeLaTeX compilation (for cross-references)
echo ""
echo "Step 4: Final XeLaTeX compilation..."
xelatex jax_main.tex

echo ""
echo "Compilation complete! Check jax_main.pdf"
