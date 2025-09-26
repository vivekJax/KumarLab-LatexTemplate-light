# 🎯 **Jackson Lab LaTeX Template - User Guide**

**Created by: Kumar Lab, The Jackson Laboratory**  
**GitHub: https://github.com/kumarlabjax/LaTeX-Template**

## 🚀 **Quick Start (2 Options)**

### **Option 1: Clean Version (Recommended)**
```latex
% Use the clean template with style package
\documentclass[11pt,onecolumn]{article}
\usepackage[whitney]{jacksonlab}  % or [whitman] for traditional font
```

### **Option 2: All-in-One Version**
```latex
% Use the original template with all formatting included
\documentclass[11pt,onecolumn]{article}
% (All formatting code is included in the file)
```

---

## 📁 **File Structure**

```
📁 Your Project/
├── 📄 jax_main.tex                   ← Clean template (recommended)
├── 📄 jackson_lab_paper.tex          ← Original template
├── 📄 jacksonlab.sty                 ← Style package
├── 📁 figures/
│   └── 🖼️ JAX logo.png
├── 📁 Fonts/
│   ├── 📁 DIN/
│   ├── 📁 Whitney/
│   └── 📁 Whitman/
└── 📄 references.bib
```

---

## 🎨 **Font Switching**

### **Clean Version (Easy)**
```latex
\usepackage[whitney]{jacksonlab}  % Modern serif
\usepackage[whitman]{jacksonlab}  % Traditional serif
```

### **Original Version**
```latex
\newcommand{\bodyfontchoice}{whitney}  % Line 25
\newcommand{\bodyfontchoice}{whitman}  % Line 25
```

---

## ✏️ **What to Edit**

### **Title**
```latex
\titletext{Your Paper Title}{Second Line if Needed}
```

### **Authors**
```latex
{\authorfont 
Your Name*, 
Co-Author Name*†, 
Another Author, 
\\ Senior Author‡}
```

### **Institution**
```latex
{\affiliationfont Your Institution \\ Your Address}
```

### **Abstract**
```latex
{\abstractfont Your actual abstract text here...}
```

### **Content**
Edit the section files:
- `01_introduction.tex`
- `02_methods.tex`
- `03_results.tex`
- `04_discussion.tex`
- `05_supplement.tex`

---

## 🔧 **Compilation**

### **Simple Compilation**
```bash
./scripts/compile_simple.sh
```

### **With Bibliography**
```bash
./scripts/compile_with_bibtex.sh
```

### **Manual Compilation**
```bash
xelatex jax_main.tex
```

---

## 🎯 **Which Version Should I Use?**

### **Use Clean Version If:**
- ✅ You want a professional, maintainable template
- ✅ You plan to create multiple papers
- ✅ You want easy font switching
- ✅ You prefer clean, readable code
- ✅ You want to customize formatting easily

### **Use Original Version If:**
- ✅ You want everything in one file
- ✅ You don't mind seeing formatting code
- ✅ You're just experimenting
- ✅ You want to understand how everything works

---

## 🛠️ **Customization**

### **Font Sizes**
Edit `jacksonlab.sty`:
```latex
\newcommand{\titlefont}{\fontsize{20}{28}\selectfont\bfseries\smartfont}
% CHANGES: 18=smaller, 22=larger title
```

### **Colors**
Edit `jacksonlab.sty`:
```latex
\newtcolorbox{titlebox}{
    colback=gray!10,  % CHANGES: white=no background, blue!10=light blue
```

### **Spacing**
Edit `jacksonlab.sty`:
```latex
\newcommand{\titletext}[2]{%
    {\titlefont\raggedright #1 \\[0.1in] #2}%
}
% CHANGES: 0.05in=less space, 0.2in=more space between title lines
```

---

## ❓ **Troubleshooting**

### **Fonts not working:**
- Make sure you're using `xelatex` (not `pdflatex`)
- Check that font files are in the `Fonts/` folder

### **Compilation errors:**
- Use the scripts in the `scripts/` folder
- Make sure all files are in the same directory

### **Style not loading:**
- Make sure `jacksonlab.sty` is in the same folder as your `.tex` file

---

## 🎉 **Benefits of Clean Version**

1. **Professional**: Follows LaTeX best practices
2. **Maintainable**: Easy to update formatting
3. **Reusable**: Use the same styles in multiple documents
4. **Clean**: Users only see content, not formatting code
5. **Flexible**: Easy to customize without breaking things

**Recommendation: Use the clean version for the best experience!**
