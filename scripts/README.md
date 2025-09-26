# 📜 Scripts Documentation

This folder contains helpful scripts to compile your LaTeX documents. **No programming knowledge required!** These scripts are like "one-click buttons" that do complex tasks for you.

## 🎯 **What are these scripts?**

Think of these scripts as **automated assistants** that handle the technical work of creating your PDF. Instead of typing complex commands, you just run a script and it does everything for you.

## 📋 **Available Scripts**

### 1. 🚀 **`compile_simple.sh`** - Quick Compilation
**What it does:** Creates your PDF in one step (fastest option)

**When to use:**
- ✅ You're just editing text content
- ✅ You're making small formatting changes
- ✅ You want to quickly see your changes
- ❌ Don't use if you added new references

**How to run:**
```bash
./scripts/compile_simple.sh
```

**What happens:**
1. Compiles your document with XeLaTeX
2. Creates `jackson_lab_paper.pdf`
3. Shows success ✅ or error ❌ message

---

### 2. 📚 **`compile_with_bibtex.sh`** - Full Compilation
**What it does:** Creates your PDF with complete bibliography processing

**When to use:**
- ✅ You added new references to `references.bib`
- ✅ You changed citations in your text
- ✅ You want to make sure all references work
- ✅ You're preparing the final version

**How to run:**
```bash
./scripts/compile_with_bibtex.sh
```

**What happens:**
1. **Step 1:** First compilation (creates basic PDF)
2. **Step 2:** Processes bibliography (handles references)
3. **Step 3:** Second compilation (adds references to PDF)
4. **Step 4:** Final compilation (fixes cross-references)
5. Creates complete `jackson_lab_paper.pdf`

---

### 3. 👀 **`watch_latex.sh`** - Auto-Compile Mode
**What it does:** Automatically updates your PDF whenever you save changes

**When to use:**
- ✅ You're actively writing and editing
- ✅ You want instant feedback as you type
- ✅ You're making many small changes
- ❌ Don't use for final compilation with references

**How to run:**
```bash
./scripts/watch_latex.sh
```

**What happens:**
1. Starts watching your `jackson_lab_paper.tex` file
2. Automatically compiles whenever you save changes
3. Updates your PDF in real-time
4. Press **Ctrl+C** to stop watching

---

## 🎯 **Which Script Should I Use?**

### **For Daily Writing:**
```bash
./scripts/watch_latex.sh
```
*Perfect for when you're actively writing and want to see changes immediately*

### **For Quick Checks:**
```bash
./scripts/compile_simple.sh
```
*Perfect for when you made small changes and want to see the result*

### **For Final Version:**
```bash
./scripts/compile_with_bibtex.sh
```
*Perfect when you're done writing and want to make sure all references work*

---

## 🖥️ **How to Run Scripts (Step by Step)**

### **Method 1: Using Terminal (Recommended)**

1. **Open Terminal** (Applications → Utilities → Terminal)
2. **Navigate to your folder:**
   ```bash
   cd "/Users/vkumar/Box Sync/KumarLab-LatexTemplate"
   ```
3. **Run your chosen script:**
   ```bash
   ./scripts/compile_simple.sh
   ```

### **Method 2: Using VS Code/Cursor**

1. **Open the folder** in VS Code or Cursor
2. **Open Terminal** (Terminal → New Terminal)
3. **Run your chosen script:**
   ```bash
   ./scripts/compile_simple.sh
   ```

### **Method 3: Using Finder (Double-click)**

1. **Open Finder** and navigate to your project folder
2. **Go to the `scripts` folder**
3. **Right-click** on the script you want
4. **Choose "Open With" → "Terminal"**

---

## ⚠️ **Troubleshooting**

### **"Permission denied" error:**
```bash
chmod +x scripts/*.sh
```
*This gives the scripts permission to run*

### **"Command not found" error:**
- Make sure you're in the right folder
- Check that the script file exists
- Try running: `ls scripts/` to see available scripts

### **Script doesn't work:**
- Make sure you have XeLaTeX installed
- Check that `jackson_lab_paper.tex` exists in the main folder
- Try running the script from the main project folder

---

## 🔧 **What Each Script Actually Does (Technical Details)**

### **compile_simple.sh:**
- Runs: `xelatex jackson_lab_paper.tex`
- Time: ~5-10 seconds
- Output: Basic PDF with content

### **compile_with_bibtex.sh:**
- Runs: `xelatex` → `bibtex` → `xelatex` → `xelatex`
- Time: ~15-30 seconds
- Output: Complete PDF with working references

### **watch_latex.sh:**
- Runs: `entr` (file watcher) + `xelatex`
- Time: Continuous (runs automatically)
- Output: Auto-updating PDF

---

## 💡 **Pro Tips**

1. **Start with watch mode** when writing
2. **Use simple compilation** for quick checks
3. **Use full compilation** before sharing your paper
4. **Keep Terminal open** while using watch mode
5. **Check the PDF** after each compilation to make sure it looks right

---

## 🆘 **Need Help?**

- **Script won't run?** Make sure you're in the right folder
- **PDF looks wrong?** Try full compilation instead of simple
- **References missing?** Use `compile_with_bibtex.sh`
- **Still having issues?** Check the main README.md for more help

Remember: These scripts are here to make your life easier! Don't be afraid to try them - they're designed to be simple and safe to use.
