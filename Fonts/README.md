# Fonts Directory

This directory contains the professional fonts used in the Jackson Laboratory paper template.

## Font Structure

### DIN Fonts (`./DIN/`)
- **Primary Use**: Sans-serif font for titles, headings, and UI elements
- **Font Family**: DIN Next LT Pro
- **Key Files**:
  - `DINNextLTPro-Regular.otf` - Standard text
  - `DINNextLTPro-Bold.otf` - Bold text
  - `DINNextLTPro-Italic.otf` - Italic text
  - `DINNextLTPro-BoldItalic.otf` - Bold italic text

### Whitney Fonts (`./Whitney/`)
- **Primary Use**: Serif font for body text and main content
- **Font Family**: Whitney HTF
- **Key Files**:
  - `WhitneyHTF-Book.otf` - Standard body text
  - `WhitneyHTF-Bold.otf` - Bold text
  - `WhitneyHTF-BookItalic.otf` - Italic text
  - `WhitneyHTF-BoldItalic.otf` - Bold italic text

## Font Configuration in LaTeX

The fonts are configured in `main_jax.tex` using the `fontspec` package:

```latex
% DIN Next LT Pro (Sans-serif)
\setsansfont{DINNextLTPro}[
    Path=./Fonts/DIN/,
    Extension = .otf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-Italic,
    BoldItalicFont=*-BoldItalic
]

% Whitney (Serif)
\setmainfont{WhitneyHTF}[
    Path=./Fonts/Whitney/,
    Extension = .otf,
    UprightFont=*-Book,
    BoldFont=*-Bold,
    ItalicFont=*-BookItalic,
    BoldItalicFont=*-BoldItalic
]
```

## Benefits

- **Environment Independence**: Works on Overleaf, local LaTeX installations, and any XeLaTeX environment
- **Professional Typography**: Uses Jackson Lab's preferred fonts for consistent branding
- **No System Dependencies**: Doesn't rely on system fonts that may not be available
- **Consistent Rendering**: Ensures the same appearance across all platforms

## Usage Notes

- Requires XeLaTeX compiler (not pdfLaTeX)
- Font files must be uploaded to your LaTeX project
- Path configuration is relative to the main document location
- All font variants are automatically mapped to LaTeX font commands
