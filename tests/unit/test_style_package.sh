#!/bin/bash

# =============================================================================
# Style Package Unit Tests
# =============================================================================
# 
# Created by: Kumar Lab, The Jackson Laboratory
# GitHub: https://github.com/kumarlabjax/LaTeX-Template
# 
# Tests the jacksonlab.sty package functionality
# 
# =============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

TEST_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$(dirname "$TEST_DIR")")"
REPORTS_DIR="$TEST_DIR/../reports"

mkdir -p "$REPORTS_DIR"

print_test() {
    echo -e "${YELLOW}🧪 Style Package Test: $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ PASSED: $1${NC}"
}

print_failure() {
    echo -e "${RED}❌ FAILED: $1${NC}"
    echo -e "${RED}   Error: $2${NC}"
}

# Test 1: Style Package Structure
test_package_structure() {
    print_test "Style Package Structure"
    
    STYLE_FILE="$PROJECT_ROOT/jacksonlab.sty"
    
    if [ ! -f "$STYLE_FILE" ]; then
        print_failure "Style Package Structure" "jacksonlab.sty not found"
        return 1
    fi
    
    # Check for required sections
    REQUIRED_SECTIONS=("PACKAGE OPTIONS" "REQUIRED PACKAGES" "FONT SETUP" "FONT COMMANDS")
    MISSING_SECTIONS=()
    
    for section in "${REQUIRED_SECTIONS[@]}"; do
        if ! grep -q "$section" "$STYLE_FILE"; then
            MISSING_SECTIONS+=("$section")
        fi
    done
    
    if [ ${#MISSING_SECTIONS[@]} -eq 0 ]; then
        print_success "Style Package Structure"
    else
        print_failure "Style Package Structure" "Missing sections: ${MISSING_SECTIONS[*]}"
        return 1
    fi
}

# Test 2: Package Options
test_package_options() {
    print_test "Package Options"
    
    STYLE_FILE="$PROJECT_ROOT/jacksonlab.sty"
    
    # Check for font options
    if grep -q "DeclareOption{whitney}" "$STYLE_FILE" && grep -q "DeclareOption{whitman}" "$STYLE_FILE"; then
        print_success "Package Options"
    else
        print_failure "Package Options" "Font options not found"
        return 1
    fi
}

# Test 3: Required Packages
test_required_packages() {
    print_test "Required Packages"
    
    STYLE_FILE="$PROJECT_ROOT/jacksonlab.sty"
    
    REQUIRED_PACKAGES=("fontspec" "amsmath" "graphicx" "geometry" "hyperref")
    MISSING_PACKAGES=()
    
    for package in "${REQUIRED_PACKAGES[@]}"; do
        if ! grep -q "RequirePackage{$package}" "$STYLE_FILE"; then
            MISSING_PACKAGES+=("$package")
        fi
    done
    
    if [ ${#MISSING_PACKAGES[@]} -eq 0 ]; then
        print_success "Required Packages"
    else
        print_failure "Required Packages" "Missing packages: ${MISSING_PACKAGES[*]}"
        return 1
    fi
}

# Test 4: Font Commands
test_font_commands() {
    print_test "Font Commands"
    
    STYLE_FILE="$PROJECT_ROOT/jacksonlab.sty"
    
    REQUIRED_COMMANDS=("\\newcommand{\\\\titlefont}" "\\newcommand{\\\\authorfont}" "\\newcommand{\\\\abstractfont}")
    MISSING_COMMANDS=()
    
    for command in "${REQUIRED_COMMANDS[@]}"; do
        if ! grep -q "$command" "$STYLE_FILE"; then
            MISSING_COMMANDS+=("$command")
        fi
    done
    
    if [ ${#MISSING_COMMANDS[@]} -eq 0 ]; then
        print_success "Font Commands"
    else
        print_failure "Font Commands" "Missing commands: ${MISSING_COMMANDS[*]}"
        return 1
    fi
}

# Test 5: Style Package Loading
test_package_loading() {
    print_test "Style Package Loading"
    
    # Create a minimal test file
    TEST_FILE="$REPORTS_DIR/test_style_loading.tex"
    cat > "$TEST_FILE" << 'EOF'
\documentclass[11pt,onecolumn]{article}
\usepackage[whitney]{jacksonlab}
\begin{document}
Test document
\end{document}
EOF
    
    if cd "$PROJECT_ROOT" && /Library/TeX/texbin/xelatex -interaction=nonstopmode "$TEST_FILE" > "$REPORTS_DIR/style_loading_test.log" 2>&1; then
        print_success "Style Package Loading"
    else
        print_failure "Style Package Loading" "Check $REPORTS_DIR/style_loading_test.log"
        return 1
    fi
}

# Run all style package tests
main() {
    echo -e "${BLUE}=============================================================================${NC}"
    echo -e "${BLUE}STYLE PACKAGE UNIT TESTS${NC}"
    echo -e "${BLUE}=============================================================================${NC}"
    
    test_package_structure
    test_package_options
    test_required_packages
    test_font_commands
    test_package_loading
    
    echo -e "${GREEN}🎉 All style package tests completed!${NC}"
}

main "$@"
