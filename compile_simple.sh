#!/bin/bash

# Simple compilation script for VS Code tasks
echo "Compiling LaTeX document..."
/Library/TeX/texbin/xelatex jackson_lab_paper.tex

if [ $? -eq 0 ]; then
    echo "✅ Compilation successful! Check jackson_lab_paper.pdf"
else
    echo "❌ Compilation failed. Check the output above for errors."
fi
