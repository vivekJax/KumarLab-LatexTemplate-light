#!/bin/bash

# Complete compilation script with BibTeX support
echo "Compiling LaTeX document with bibliography..."
echo ""

# Step 1: First XeLaTeX compilation
echo "Step 1: First XeLaTeX compilation..."
/Library/TeX/texbin/xelatex jackson_lab_paper.tex

# Step 2: Run BibTeX
echo ""
echo "Step 2: Processing bibliography with BibTeX..."
/Library/TeX/texbin/bibtex jackson_lab_paper

# Step 3: Second XeLaTeX compilation
echo ""
echo "Step 3: Second XeLaTeX compilation..."
/Library/TeX/texbin/xelatex jackson_lab_paper.tex

# Step 4: Final XeLaTeX compilation (for cross-references)
echo ""
echo "Step 4: Final XeLaTeX compilation..."
/Library/TeX/texbin/xelatex jackson_lab_paper.tex

echo ""
echo "Compilation complete! Check jackson_lab_paper.pdf"
