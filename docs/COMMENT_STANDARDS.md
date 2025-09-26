# 📝 **LaTeX Comment Documentation Standards**

**Created by: Kumar Lab, The Jackson Laboratory**  
**GitHub: https://github.com/kumarlabjax/LaTeX-Template**

## 🎯 **Improved Comment Formatting**

I've updated the comment formatting to follow better documentation standards. Here's what I changed and why:

---

## ✅ **What I Improved**

### **1. Better Spacing**
```latex
% OLD (hard to read):
% Use these symbols for author designations:
% * = Equal contribution
% † = Correspondence
% ‡ = Senior author

% NEW (clean and readable):
% Use these symbols for author designations:
%   * = Equal contribution
%   † = Correspondence  
%   ‡ = Senior author
```

### **2. Clear Section Headers**
```latex
% OLD:
% =============================================================================
% TITLE PAGE - Everything goes in the grey box
% =============================================================================

% NEW:
% =============================================================================
% TITLE PAGE - Everything goes in the grey box
% =============================================================================
% 
% This section contains all title page elements...
```

### **3. Actionable Instructions**
```latex
% OLD:
% CHANGES: Replace with your actual author names

% NEW:
% CHANGES: Replace with your actual author names and designations
```

### **4. Context and Purpose**
```latex
% OLD:
% \affiliationfont applies our custom affiliation formatting

% NEW:
% \affiliationfont applies our custom affiliation formatting (10pt, regular, DIN font)
% 
% CHANGES: Replace with your actual institution and address
```

---

## 📚 **LaTeX Documentation Best Practices**

### **1. Comment Structure**
```latex
% =============================================================================
% SECTION HEADER
% =============================================================================
% 
% Brief description of what this section does
% 
% DETAILS:
%   - Point 1: What it does
%   - Point 2: Why it's needed
%   - Point 3: How to modify
% 
% CHANGES: What users should edit
```

### **2. Code Documentation**
```latex
% Function/command name: Brief description
% Parameters: What each parameter does
% Usage: How to use it
% Example: \command{parameter}
% 
% CHANGES: What users can modify
```

### **3. User Instructions**
```latex
% EDIT THESE FILES:
%   - file1.tex    (Description)
%   - file2.tex    (Description)
%   - file3.tex    (Description)
```

---

## 🎨 **Visual Improvements**

### **Before (Hard to Read):**
```latex
% Author List with Designations
% Use these symbols for author designations:
% * = Equal contribution
% † = Correspondence
% ‡ = Senior author
% § = Additional designation
% CHANGES: Replace with your actual author names and designations
```

### **After (Clean and Readable):**
```latex
% Author List with Designations
% Use these symbols for author designations:
%   * = Equal contribution
%   † = Correspondence  
%   ‡ = Senior author
%   § = Additional designation
% 
% CHANGES: Replace with your actual author names and designations
```

---

## 🔧 **Technical Standards**

### **1. Consistent Indentation**
- Use 2 spaces for sub-comments
- Align related items
- Group related information

### **2. Clear Hierarchy**
```latex
% Main comment
%   Sub-comment 1
%   Sub-comment 2
% 
% Another main comment
```

### **3. Actionable Language**
- Use "CHANGES:" for user modifications
- Use "EDIT:" for content updates
- Use "NOTE:" for important information

### **4. Context and Purpose**
- Explain what code does
- Explain why it's needed
- Explain how to modify it

---

## 📖 **Documentation Types**

### **1. User Documentation**
```latex
% CHANGES: Replace with your actual content
% EDIT: Update this section
% NOTE: Important information
```

### **2. Technical Documentation**
```latex
% Function: What it does
% Parameters: What each does
% Usage: How to use
```

### **3. Maintenance Documentation**
```latex
% TODO: Future improvements
% FIXME: Known issues
% HACK: Temporary solutions
```

---

## 🎯 **Benefits of Improved Formatting**

### **1. Readability**
- ✅ Clear visual hierarchy
- ✅ Easy to scan
- ✅ Logical grouping

### **2. Maintainability**
- ✅ Easy to find information
- ✅ Clear instructions
- ✅ Consistent structure

### **3. User Experience**
- ✅ Clear what to edit
- ✅ Understandable instructions
- ✅ Professional appearance

### **4. Collaboration**
- ✅ Easy for others to understand
- ✅ Clear modification points
- ✅ Consistent standards

---

## 🚀 **Implementation**

The improved comment formatting is now implemented in:
- ✅ `jax_main.tex` - Main template file
- ✅ `jacksonlab.sty` - Style package
- ✅ All documentation files

**Result**: Much cleaner, more readable, and more professional documentation that follows LaTeX best practices!
