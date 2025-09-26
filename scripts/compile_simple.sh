#!/bin/bash

# Simple compilation script for VS Code tasks
echo "Compiling LaTeX document..."
/Library/TeX/texbin/xelatex jax_main.tex

if [ $? -eq 0 ]; then
    echo "✅ Compilation successful! Check jax_main.pdf"
else
    echo "❌ Compilation failed. Check the output above for errors."
fi
