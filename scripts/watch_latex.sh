#!/bin/bash

# Auto-compile LaTeX when file changes
echo "Watching jackson_lab_paper.tex for changes..."
echo "Press Ctrl+C to stop"
echo ""

ls jackson_lab_paper.tex | entr -r /Library/TeX/texbin/xelatex jackson_lab_paper.tex
