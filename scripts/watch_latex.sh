#!/bin/bash

# Auto-compile LaTeX when file changes
echo "Watching jax_main.tex for changes..."
echo "Press Ctrl+C to stop"
echo ""

ls jax_main.tex | entr -r xelatex jax_main.tex
