#!/bin/bash

# =============================================================================
# LaTeX Template Test Runner
# =============================================================================
# 
# Created by: Kumar Lab, The Jackson Laboratory
# GitHub: https://github.com/kumarlabjax/LaTeX-Template
# 
# This script runs comprehensive tests for the LaTeX template:
# - Unit tests (individual component testing)
# - End-to-end tests (full template compilation)
# - Font switching tests
# - Style package tests
# 
# =============================================================================

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test configuration
TEST_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$TEST_DIR")"
REPORTS_DIR="$TEST_DIR/reports"
FIXTURES_DIR="$TEST_DIR/fixtures"

# Create reports directory
mkdir -p "$REPORTS_DIR"

# Test counters
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

# =============================================================================
# UTILITY FUNCTIONS
# =============================================================================

print_header() {
    echo -e "${BLUE}=============================================================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}=============================================================================${NC}"
}

print_test() {
    echo -e "${YELLOW}🧪 Running: $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ PASSED: $1${NC}"
    ((PASSED_TESTS++))
}

print_failure() {
    echo -e "${RED}❌ FAILED: $1${NC}"
    echo -e "${RED}   Error: $2${NC}"
    ((FAILED_TESTS++))
}

print_summary() {
    echo -e "${BLUE}=============================================================================${NC}"
    echo -e "${BLUE}TEST SUMMARY${NC}"
    echo -e "${BLUE}=============================================================================${NC}"
    echo -e "Total Tests: $TOTAL_TESTS"
    echo -e "${GREEN}Passed: $PASSED_TESTS${NC}"
    echo -e "${RED}Failed: $FAILED_TESTS${NC}"
    
    if [ $FAILED_TESTS -eq 0 ]; then
        echo -e "${GREEN}🎉 ALL TESTS PASSED!${NC}"
        exit 0
    else
        echo -e "${RED}💥 SOME TESTS FAILED!${NC}"
        exit 1
    fi
}

# =============================================================================
# UNIT TESTS
# =============================================================================

run_unit_tests() {
    print_header "UNIT TESTS"
    
    # Test 1: LaTeX Compilation
    print_test "LaTeX Compilation Test"
    ((TOTAL_TESTS++))
    if cd "$PROJECT_ROOT" && /Library/TeX/texbin/xelatex -interaction=nonstopmode jax_main.tex > "$REPORTS_DIR/compilation.log" 2>&1; then
        print_success "LaTeX Compilation"
    else
        print_failure "LaTeX Compilation" "Check $REPORTS_DIR/compilation.log"
    fi
    
    # Test 2: Style Package Loading
    print_test "Style Package Loading Test"
    ((TOTAL_TESTS++))
    if cd "$PROJECT_ROOT" && /Library/TeX/texbin/xelatex -interaction=nonstopmode -halt-on-error -file-line-error jax_main.tex > "$REPORTS_DIR/style_loading.log" 2>&1; then
        print_success "Style Package Loading"
    else
        print_failure "Style Package Loading" "Check $REPORTS_DIR/style_loading.log"
    fi
    
    # Test 3: Font Availability
    print_test "Font Availability Test"
    ((TOTAL_TESTS++))
    if [ -d "$PROJECT_ROOT/Fonts/DIN" ] && [ -d "$PROJECT_ROOT/Fonts/Whitney" ] && [ -d "$PROJECT_ROOT/Fonts/Whitman" ]; then
        print_success "Font Availability"
    else
        print_failure "Font Availability" "Missing font directories"
    fi
    
    # Test 4: Required Files
    print_test "Required Files Test"
    ((TOTAL_TESTS++))
    REQUIRED_FILES=("jax_main.tex" "jackson_lab_paper.tex" "jacksonlab.sty" "LICENSE" "README.md")
    MISSING_FILES=()
    
    for file in "${REQUIRED_FILES[@]}"; do
        if [ ! -f "$PROJECT_ROOT/$file" ]; then
            MISSING_FILES+=("$file")
        fi
    done
    
    if [ ${#MISSING_FILES[@]} -eq 0 ]; then
        print_success "Required Files"
    else
        print_failure "Required Files" "Missing: ${MISSING_FILES[*]}"
    fi
}

# =============================================================================
# END-TO-END TESTS
# =============================================================================

run_e2e_tests() {
    print_header "END-TO-END TESTS"
    
    # Test 1: Clean Template Compilation
    print_test "Clean Template (jax_main.tex) E2E Test"
    ((TOTAL_TESTS++))
    if cd "$PROJECT_ROOT" && /Library/TeX/texbin/xelatex -interaction=nonstopmode jax_main.tex > "$REPORTS_DIR/jax_main_e2e.log" 2>&1; then
        if [ -f "$PROJECT_ROOT/jax_main.pdf" ]; then
            print_success "Clean Template E2E"
        else
            print_failure "Clean Template E2E" "PDF not generated"
        fi
    else
        print_failure "Clean Template E2E" "Check $REPORTS_DIR/jax_main_e2e.log"
    fi
    
    # Test 2: Original Template Compilation
    print_test "Original Template (jackson_lab_paper.tex) E2E Test"
    ((TOTAL_TESTS++))
    if cd "$PROJECT_ROOT" && /Library/TeX/texbin/xelatex -interaction=nonstopmode jackson_lab_paper.tex > "$REPORTS_DIR/jackson_lab_paper_e2e.log" 2>&1; then
        if [ -f "$PROJECT_ROOT/jackson_lab_paper.pdf" ]; then
            print_success "Original Template E2E"
        else
            print_failure "Original Template E2E" "PDF not generated"
        fi
    else
        print_failure "Original Template E2E" "Check $REPORTS_DIR/jackson_lab_paper_e2e.log"
    fi
    
    # Test 3: Font Switching Test
    print_test "Font Switching Test"
    ((TOTAL_TESTS++))
    
    # Test Whitney font
    if cd "$PROJECT_ROOT" && sed -i.bak 's/\\usepackage\[whitney\]{jacksonlab}/\\usepackage[whitney]{jacksonlab}/' jax_main.tex; then
        if /Library/TeX/texbin/xelatex -interaction=nonstopmode jax_main.tex > "$REPORTS_DIR/font_whitney.log" 2>&1; then
            print_success "Whitney Font Switching"
        else
            print_failure "Whitney Font Switching" "Check $REPORTS_DIR/font_whitney.log"
        fi
    else
        print_failure "Font Switching" "Could not modify template"
    fi
    
    # Test Whitman font
    if cd "$PROJECT_ROOT" && sed -i.bak 's/\\usepackage\[whitney\]{jacksonlab}/\\usepackage[whitman]{jacksonlab}/' jax_main.tex; then
        if /Library/TeX/texbin/xelatex -interaction=nonstopmode jax_main.tex > "$REPORTS_DIR/font_whitman.log" 2>&1; then
            print_success "Whitman Font Switching"
        else
            print_failure "Whitman Font Switching" "Check $REPORTS_DIR/font_whitman.log"
        fi
    else
        print_failure "Font Switching" "Could not modify template"
    fi
    
    # Restore original font
    cd "$PROJECT_ROOT" && sed -i.bak 's/\\usepackage\[whitman\]{jacksonlab}/\\usepackage[whitney]{jacksonlab}/' jax_main.tex
    rm -f jax_main.tex.bak
}

# =============================================================================
# SCRIPT TESTS
# =============================================================================

run_script_tests() {
    print_header "SCRIPT TESTS"
    
    # Test 1: Compile Simple Script
    print_test "Compile Simple Script Test"
    ((TOTAL_TESTS++))
    if cd "$PROJECT_ROOT" && ./scripts/compile_simple.sh > "$REPORTS_DIR/compile_simple.log" 2>&1; then
        print_success "Compile Simple Script"
    else
        print_failure "Compile Simple Script" "Check $REPORTS_DIR/compile_simple.log"
    fi
    
    # Test 2: Script Permissions
    print_test "Script Permissions Test"
    ((TOTAL_TESTS++))
    SCRIPTS=("scripts/compile_simple.sh" "scripts/compile_with_bibtex.sh" "scripts/watch_latex.sh")
    PERMISSION_ERRORS=()
    
    for script in "${SCRIPTS[@]}"; do
        if [ ! -x "$PROJECT_ROOT/$script" ]; then
            PERMISSION_ERRORS+=("$script")
        fi
    done
    
    if [ ${#PERMISSION_ERRORS[@]} -eq 0 ]; then
        print_success "Script Permissions"
    else
        print_failure "Script Permissions" "Not executable: ${PERMISSION_ERRORS[*]}"
    fi
}

# =============================================================================
# MAIN EXECUTION
# =============================================================================

main() {
    print_header "LaTeX TEMPLATE TEST SUITE"
    echo -e "${BLUE}Testing Jackson Laboratory LaTeX Template${NC}"
    echo -e "${BLUE}Created by: Kumar Lab, The Jackson Laboratory${NC}"
    echo ""
    
    # Run all test suites
    run_unit_tests
    echo ""
    run_e2e_tests
    echo ""
    run_script_tests
    echo ""
    
    # Print summary
    print_summary
}

# Run main function
main "$@"
