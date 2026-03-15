#!/bin/bash

# =============================================================================
# Font Unit Tests
# =============================================================================
# 
# Created by: Kumar Lab, The Jackson Laboratory
# GitHub: https://github.com/kumarlabjax/LaTeX-Template
# 
# Tests font availability and switching functionality
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
    echo -e "${YELLOW}🧪 Font Test: $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ PASSED: $1${NC}"
}

print_failure() {
    echo -e "${RED}❌ FAILED: $1${NC}"
    echo -e "${RED}   Error: $2${NC}"
}

# Test 1: Font Directory Structure
test_font_directories() {
    print_test "Font Directory Structure"
    
    FONT_DIRS=("Fonts/DIN" "Fonts/Whitney" "Fonts/Whitman")
    MISSING_DIRS=()
    
    for dir in "${FONT_DIRS[@]}"; do
        if [ ! -d "$PROJECT_ROOT/$dir" ]; then
            MISSING_DIRS+=("$dir")
        fi
    done
    
    if [ ${#MISSING_DIRS[@]} -eq 0 ]; then
        print_success "Font Directory Structure"
    else
        print_failure "Font Directory Structure" "Missing directories: ${MISSING_DIRS[*]}"
        return 1
    fi
}

# Test 2: DIN Font Files
test_din_fonts() {
    print_test "DIN Font Files"
    
    DIN_FONTS=("DINNextLTPro-Regular.otf" "DINNextLTPro-Bold.otf" "DINNextLTPro-Italic.otf")
    MISSING_FONTS=()
    
    for font in "${DIN_FONTS[@]}"; do
        if [ ! -f "$PROJECT_ROOT/Fonts/DIN/$font" ]; then
            MISSING_FONTS+=("$font")
        fi
    done
    
    if [ ${#MISSING_FONTS[@]} -eq 0 ]; then
        print_success "DIN Font Files"
    else
        print_failure "DIN Font Files" "Missing fonts: ${MISSING_FONTS[*]}"
        return 1
    fi
}

# Test 3: Whitney Font Files
test_whitney_fonts() {
    print_test "Whitney Font Files"
    
    # Check if Whitney directory has font files
    WHITNEY_COUNT=$(find "$PROJECT_ROOT/Fonts/Whitney" -name "*.otf" | wc -l)
    
    if [ "$WHITNEY_COUNT" -gt 0 ]; then
        print_success "Whitney Font Files ($WHITNEY_COUNT files found)"
    else
        print_failure "Whitney Font Files" "No .otf files found in Whitney directory"
        return 1
    fi
}

# Test 4: Whitman Font Files
test_whitman_fonts() {
    print_test "Whitman Font Files"
    
    WHITMAN_FONTS=("Whitman-RomanLF.ttf" "Whitman-BoldLF.ttf" "Whitman-ItalicLF.ttf")
    MISSING_FONTS=()
    
    for font in "${WHITMAN_FONTS[@]}"; do
        if [ ! -f "$PROJECT_ROOT/Fonts/Whitman/$font" ]; then
            MISSING_FONTS+=("$font")
        fi
    done
    
    if [ ${#MISSING_FONTS[@]} -eq 0 ]; then
        print_success "Whitman Font Files"
    else
        print_failure "Whitman Font Files" "Missing fonts: ${MISSING_FONTS[*]}"
        return 1
    fi
}

# Test 5: Font Switching in Style Package
test_font_switching() {
    print_test "Font Switching in Style Package"
    
    # Check if style package has font switching logic
    if grep -q "\\newcommand{\\\\bodyfontchoice}" "$PROJECT_ROOT/jacksonlab.sty"; then
        print_success "Font Switching Logic"
    else
        print_failure "Font Switching Logic" "Font switching not found in style package"
        return 1
    fi
}

# Run all font tests
main() {
    echo -e "${BLUE}=============================================================================${NC}"
    echo -e "${BLUE}FONT UNIT TESTS${NC}"
    echo -e "${BLUE}=============================================================================${NC}"
    
    test_font_directories
    test_din_fonts
    test_whitney_fonts
    test_whitman_fonts
    test_font_switching
    
    echo -e "${GREEN}🎉 All font tests completed!${NC}"
}

main "$@"
