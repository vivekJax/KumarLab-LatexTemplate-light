# LaTeX Comment Documentation Standards

**Created by: Kumar Lab, The Jackson Laboratory**
**GitHub: https://github.com/KumarLabJax/KumarLab-LatexTemplate**

---

## Comment Formatting

### Section Headers
```latex
% =============================================================================
% SECTION HEADER
% =============================================================================
```

### User Instructions
Mark editable areas with `CHANGES:` so users know what to modify:
```latex
% CHANGES: Replace with your actual author names and designations
{\authorfont First Author*, Second Author†}
```

### Code Documentation
```latex
% \affiliationfont applies our custom affiliation formatting (10pt, regular, DIN font)
%
% CHANGES: Replace with your actual institution and address
{\affiliationfont The Jackson Laboratory}
```

---

## Comment Types

| Prefix | Meaning |
|--------|---------|
| `CHANGES:` | What users should edit |
| `EDIT:` | Content to update |
| `NOTE:` | Important information |

---

## Formatting Rules

- Use 2 spaces for sub-comments
- Group related items together
- Separate comment blocks with a blank `%` line
- Keep comments concise and actionable

### Example
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

## Applied In
- `jax_main.tex` — Full paper template
- `jax_simple.tex` — Quick document template
- `jacksonlab.sty` — Style package
