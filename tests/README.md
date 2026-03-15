# LaTeX Template Testing - Super Simple Guide! 🧪

**Created by: Kumar Lab, The Jackson Laboratory**  
**GitHub: https://github.com/kumarlabjax/LaTeX-Template**

## 🤔 **What is Testing? (Like Checking Your Homework)**

Imagine you wrote a story and want to make sure:
- ✅ All the words are spelled correctly
- ✅ The story makes sense from start to finish
- ✅ Your teacher can read it easily

**Testing your LaTeX template is like that!** We check:
- ✅ All the fonts work (like checking if your pencils have lead)
- ✅ Your document compiles into a PDF (like making sure your printer works)
- ✅ Everything looks good (like checking if your drawing is pretty)

## 🎯 **Why Do We Need Testing?**

**Without Testing:**
- 😰 You change something and break everything
- 😰 Your PDF won't work and you don't know why
- 😰 You waste time trying to fix things

**With Testing:**
- 😊 You change something and immediately know if it works
- 😊 Your PDF always works perfectly
- 😊 You save time and feel confident

## 🚀 **How to Run Tests (Super Easy!)**

### **Step 1: Run All Tests (Like Checking Everything at Once)**
```bash
./tests/run_tests.sh
```
**What this does:** Checks everything - fonts, compilation, PDFs - all at once!

### **Step 2: Continuous Testing (Like Having a Helper Watch for You)**
```bash
./tests/watch_tests.sh
```
**What this does:** Like having a friend who watches your work and tells you immediately if something breaks!

### **Step 3: Run Specific Tests (Like Checking Just One Thing)**
```bash
# Check just the fonts (like checking if your crayons work)
./tests/unit/test_fonts.sh

# Check just the style package (like checking if your ruler is straight)
./tests/unit/test_style_package.sh

# Check the complete workflow (like checking your whole project)
./tests/e2e/test_complete_workflow.sh
```

## 📁 **What's in the Tests Folder? (Like Your School Supplies)**

```
tests/
├── run_tests.sh              # The main test runner (like your teacher)
├── watch_tests.sh            # The watcher (like a helpful friend)
├── unit/                     # Small tests (like checking individual tools)
│   ├── test_fonts.sh         # Font tests (like checking your crayons)
│   └── test_style_package.sh # Style tests (like checking your ruler)
├── e2e/                      # Big tests (like checking your whole project)
│   └── test_complete_workflow.sh
├── reports/                  # Test results (like your report card)
└── README.md                 # This guide (like your instruction manual)
```

**Think of it like this:**
- **`run_tests.sh`** = Your teacher who checks your homework
- **`watch_tests.sh`** = A friend who watches you work and helps
- **`unit/`** = Checking individual tools (like testing each crayon)
- **`e2e/`** = Checking your whole project (like testing your complete drawing)
- **`reports/`** = Your report card showing what's good and what needs fixing

## 🔧 **Types of Tests (Like Different Ways to Check Your Work)**

### **1. Unit Tests (Like Checking Each Tool Individually)**

**What it does:** Checks each piece separately, like testing each crayon in your box

**Font Tests** (`test_fonts.sh`):
- ✅ Are all the font folders there? (like checking if your crayon box has all sections)
- ✅ Do the DIN fonts exist? (like checking if your black crayon is there)
- ✅ Do the Whitney fonts exist? (like checking if your blue crayon is there)
- ✅ Do the Whitman fonts exist? (like checking if your red crayon is there)
- ✅ Can we switch between fonts? (like checking if you can pick different crayons)

**Style Package Tests** (`test_style_package.sh`):
- ✅ Is the style package set up correctly? (like checking if your ruler is straight)
- ✅ Can we choose different fonts? (like checking if you can pick different colors)
- ✅ Do all the required parts load? (like checking if all your supplies are working)
- ✅ Are the font commands defined? (like checking if your pencil sharpener works)

### **2. End-to-End Tests (Like Checking Your Complete Project)**

**What it does:** Tests the whole process from start to finish, like checking your complete drawing

**Complete Workflow Tests** (`test_complete_workflow.sh`):
- ✅ Does the clean template work? (like checking if your main drawing is good)
- ✅ Does the original template work? (like checking if your backup drawing is good)
- ✅ Can we switch fonts and still work? (like checking if you can change colors and it still looks good)
- ✅ Does the bibliography work? (like checking if your references are correct)
- ✅ Is the final PDF good? (like checking if your final drawing is pretty)

### **3. Continuous Testing (Like Having a Helper Friend)**

**What it does:** Like having a friend who watches you work and tells you immediately if something goes wrong

**File Watching** (`watch_tests.sh`):
- 👀 Watches your files (like a friend watching you draw)
- 🔄 Runs tests automatically when you save (like your friend checking your work)
- 📊 Shows results immediately (like your friend saying "good job!" or "fix this!")
- ⏹️ Press Ctrl+C to stop (like telling your friend "thanks, I'm done!")

## 📊 **What Do the Test Results Mean? (Like Your Report Card)**

### **✅ Good Signs (Like Getting A's on Your Report Card)**
- ✅ All tests pass (like getting all A's!)
- 📄 PDFs are created successfully (like your printer working perfectly!)
- 🔤 Fonts load correctly (like all your crayons working!)
- 📚 Bibliography works (like your references being correct!)
- 🎨 Style package functions (like your ruler being straight!)

### **❌ Bad Signs (Like Getting F's on Your Report Card)**
- ❌ Compilation errors (like your printer being broken!)
- 📄 Missing PDFs (like your drawing not printing!)
- 🔤 Font loading issues (like your crayons being broken!)
- 📚 Bibliography problems (like your references being wrong!)
- 🎨 Style package errors (like your ruler being bent!)

### **📋 Test Reports (Like Your Detailed Report Card)**
All test results are saved in `tests/reports/`:
- `compilation.log` - What happened when we tried to make your PDF (like your printer's report)
- `font_*.log` - What happened when we checked your fonts (like checking your crayons)
- `*_workflow.log` - What happened when we checked everything (like your complete project report)

## 🛠️ **When Things Go Wrong (Like When Your Crayons Break)**

### **Common Problems and How to Fix Them**

**1. "entr command not found" (Like Your Helper Friend Not Being There)**
```bash
# Install entr (like getting a new helper friend)
brew install entr
```
**What this means:** Your computer doesn't have the helper program that watches for changes.

**2. "XeLaTeX not found" (Like Your Printer Not Being There)**
```bash
# Install MacTeX (like getting a new printer)
brew install --cask mactex
```
**What this means:** Your computer doesn't have the program that makes PDFs.

**3. "Permission denied" (Like Your Teacher Saying You Can't Use the Supplies)**
```bash
# Make scripts executable (like getting permission to use the supplies)
chmod +x tests/*.sh
chmod +x tests/unit/*.sh
chmod +x tests/e2e/*.sh
```
**What this means:** Your computer won't let the test scripts run.

**4. Font tests failing (Like Your Crayons Not Working)**
- Check that font directories exist (like checking if your crayon box is there)
- Verify font files are present (like checking if your crayons are in the box)
- Ensure font paths are correct (like making sure your crayons are in the right place)

### **Debug Mode (Like Getting Extra Help)**
Run tests with verbose output:
```bash
# Run with detailed logging (like getting a very detailed report card)
./tests/run_tests.sh 2>&1 | tee test_output.log
```
**What this means:** Get a very detailed report of what's happening, like getting extra help from your teacher.

## 🎯 **How to Use Testing (Like How to Use Your School Supplies)**

### **Before Making Changes (Like Checking Your Supplies Before Starting)**
1. Run all tests to make sure everything works (like checking if all your crayons work)
2. Note any problems that already exist (like noting which crayons are broken)
3. Make your changes (like starting your drawing)
4. Run tests again to make sure you didn't break anything (like checking if your drawing still looks good)

### **After Making Changes (Like Checking Your Work After Drawing)**
1. Run unit tests first (like checking each crayon individually - this is faster!)
2. Run end-to-end tests (like checking your complete drawing)
3. Check test reports for details (like reading your teacher's comments)
4. Fix any issues found (like fixing mistakes in your drawing)

### **Continuous Development (Like Having a Helper Friend)**
1. Start continuous testing: `./tests/watch_tests.sh` (like asking a friend to watch you work)
2. Make your changes (like drawing your picture)
3. Watch tests run automatically (like your friend checking your work as you go)
4. Fix issues as they appear (like fixing mistakes right away when your friend points them out)

## 📈 **What We Check (Like Your Complete School Supply List)**

| What We Check | Small Tests | Big Tests | How Much We Check |
|---------------|-------------|-----------|-------------------|
| Fonts (like crayons) | ✅ | ✅ | 100% (everything!) |
| Style Package (like your ruler) | ✅ | ✅ | 100% (everything!) |
| Compilation (like your printer) | ✅ | ✅ | 100% (everything!) |
| Font Switching (like changing colors) | ✅ | ✅ | 100% (everything!) |
| Bibliography (like your references) | ✅ | ✅ | 100% (everything!) |
| Scripts (like your tools) | ✅ | ✅ | 100% (everything!) |

**This means we check EVERYTHING!** Like making sure every single crayon in your box works perfectly!

## 🔄 **Advanced Stuff (Like Using Your Supplies with Special Tools)**

### **VS Code Integration (Like Using Special Drawing Tools)**
Add to your VS Code tasks (`.vscode/tasks.json`):
```json
{
    "label": "Run Tests",
    "type": "shell",
    "command": "./tests/run_tests.sh",
    "group": "test"
}
```
**What this means:** Like having a special button in your drawing program that checks your work automatically!

### **Git Hooks (Like Having a Teacher Check Your Work Before You Turn It In)**
Add pre-commit hook to run tests:
```bash
# .git/hooks/pre-commit
#!/bin/bash
./tests/run_tests.sh
```
**What this means:** Like having a teacher check your homework before you turn it in, so you never turn in broken work!

### **CI/CD Integration (Like Having a Robot Teacher)**
For automated testing in CI/CD:
```yaml
# .github/workflows/test.yml
name: Test LaTeX Template
on: [push, pull_request]
jobs:
  test:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install dependencies
        run: brew install --cask mactex
      - name: Run tests
        run: ./tests/run_tests.sh
```
**What this means:** Like having a robot teacher that automatically checks your work when you share it with others!

## 📚 **Super Advanced Stuff (Like Being a Pro Artist)**

### **Custom Test Configuration (Like Customizing Your Art Supplies)**
Modify test parameters in `run_tests.sh`:
```bash
# Change test timeout (like setting a timer for your drawing)
TIMEOUT=30

# Add custom test files (like adding your own special crayons)
CUSTOM_TESTS=("custom_test.sh")
```

### **Test Data Management (Like Organizing Your Art Supplies)**
Add test fixtures in `tests/fixtures/`:
```
fixtures/
├── test_document.tex        # Like a practice drawing
├── test_bibliography.bib    # Like a practice reference list
└── test_figures/           # Like practice pictures
```

### **Performance Testing (Like Timing How Fast You Can Draw)**
Add performance benchmarks:
```bash
# Test compilation speed (like timing how fast you can draw)
time ./tests/run_tests.sh
```

## 🎉 **What Success Looks Like (Like Getting All A's!)**

- **100% Test Pass Rate**: All tests should pass (like getting all A's on your report card!)
- **Fast Execution**: Tests complete in under 2 minutes (like finishing your homework quickly!)
- **Reliable**: Tests should be consistent and repeatable (like your crayons always working!)
- **Comprehensive**: Cover all major functionality (like checking everything on your supply list!)
- **Automated**: Run automatically on file changes (like having a helper friend who always checks your work!)

---

**This testing framework is like having the best art teacher who makes sure your LaTeX template is perfect every time!** 🚀
