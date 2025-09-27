#!/bin/bash

# =============================================================================
# Complete Workflow End-to-End Test
# =============================================================================
# 
# Created by: Kumar Lab, The Jackson Laboratory
# GitHub: https://github.com/kumarlabjax/LaTeX-Template
# 
# Tests the complete workflow from template to final PDF
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
    echo -e "${YELLOW}🧪 E2E Test: $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ PASSED: $1${NC}"
}

print_failure() {
    echo -e "${RED}❌ FAILED: $1${NC}"
    echo -e "${RED}   Error: $2${NC}"
}

# Test 1: Clean Template Complete Workflow
test_clean_template_workflow() {
    print_test "Clean Template Complete Workflow"
    
    cd "$PROJECT_ROOT"
    
    # Step 1: Compile with simple script
    if ./scripts/compile_simple.sh > "$REPORTS_DIR/clean_workflow.log" 2>&1; then
        if [ -f "jax_main.pdf" ]; then
            print_success "Clean Template Complete Workflow"
        else
            print_failure "Clean Template Complete Workflow" "PDF not generated"
            return 1
        fi
    else
        print_failure "Clean Template Complete Workflow" "Compilation failed"
        return 1
    fi
}

# Test 2: Original Template Complete Workflow
test_original_template_workflow() {
    print_test "Original Template Complete Workflow"
    
    cd "$PROJECT_ROOT"
    
    # Step 1: Compile original template
    if /Library/TeX/texbin/xelatex -interaction=nonstopmode jackson_lab_paper.tex > "$REPORTS_DIR/original_workflow.log" 2>&1; then
        if [ -f "jackson_lab_paper.pdf" ]; then
            print_success "Original Template Complete Workflow"
        else
            print_failure "Original Template Complete Workflow" "PDF not generated"
            return 1
        fi
    else
        print_failure "Original Template Complete Workflow" "Compilation failed"
        return 1
    fi
}

# Test 3: Font Switching Workflow
test_font_switching_workflow() {
    print_test "Font Switching Workflow"
    
    cd "$PROJECT_ROOT"
    
    # Test Whitney font
    if sed -i.bak 's/\\usepackage\[whitney\]{jacksonlab}/\\usepackage[whitney]{jacksonlab}/' jax_main.tex; then
        if /Library/TeX/texbin/xelatex -interaction=nonstopmode jax_main.tex > "$REPORTS_DIR/font_whitney_workflow.log" 2>&1; then
            if [ -f "jax_main.pdf" ]; then
                print_success "Whitney Font Workflow"
            else
                print_failure "Whitney Font Workflow" "PDF not generated"
                return 1
            fi
        else
            print_failure "Whitney Font Workflow" "Compilation failed"
            return 1
        fi
    else
        print_failure "Font Switching Workflow" "Could not modify template"
        return 1
    fi
    
    # Test Whitman font
    if sed -i.bak 's/\\usepackage\[whitney\]{jacksonlab}/\\usepackage[whitman]{jacksonlab}/' jax_main.tex; then
        if /Library/TeX/texbin/xelatex -interaction=nonstopmode jax_main.tex > "$REPORTS_DIR/font_whitman_workflow.log" 2>&1; then
            if [ -f "jax_main.pdf" ]; then
                print_success "Whitman Font Workflow"
            else
                print_failure "Whitman Font Workflow" "PDF not generated"
                return 1
            fi
        else
            print_failure "Whitman Font Workflow" "Compilation failed"
            return 1
        fi
    else
        print_failure "Font Switching Workflow" "Could not modify template"
        return 1
    fi
    
    # Restore original font
    sed -i.bak 's/\\usepackage\[whitman\]{jacksonlab}/\\usepackage[whitney]{jacksonlab}/' jax_main.tex
    rm -f jax_main.tex.bak
}

# Test 4: Bibliography Workflow
test_bibliography_workflow() {
    print_test "Bibliography Workflow"
    
    cd "$PROJECT_ROOT"
    
    # Test bibliography compilation
    if ./scripts/compile_with_bibtex.sh > "$REPORTS_DIR/bibliography_workflow.log" 2>&1; then
        if [ -f "jax_main.pdf" ]; then
            print_success "Bibliography Workflow"
        else
            print_failure "Bibliography Workflow" "PDF not generated"
            return 1
        fi
    else
        print_failure "Bibliography Workflow" "Compilation failed"
        return 1
    fi
}

# Test 5: PDF Quality Check
test_pdf_quality() {
    print_test "PDF Quality Check"
    
    cd "$PROJECT_ROOT"
    
    # Check if PDFs exist and have reasonable size
    PDFS=("jax_main.pdf" "jackson_lab_paper.pdf")
    
    for pdf in "${PDFS[@]}"; do
        if [ -f "$pdf" ]; then
            SIZE=$(stat -f%z "$pdf" 2>/dev/null || echo "0")
            if [ "$SIZE" -gt 1000 ]; then  # At least 1KB
                print_success "PDF Quality Check ($pdf: ${SIZE} bytes)"
            else
                print_failure "PDF Quality Check" "$pdf is too small (${SIZE} bytes)"
                return 1
            fi
        else
            print_failure "PDF Quality Check" "$pdf not found"
            return 1
        fi
    done
}

# Run all E2E tests
main() {
    echo -e "${BLUE}=============================================================================${NC}"
    echo -e "${BLUE}COMPLETE WORKFLOW END-TO-END TESTS${NC}"
    echo -e "${BLUE}=============================================================================${NC}"
    
    test_clean_template_workflow
    test_original_template_workflow
    test_font_switching_workflow
    test_bibliography_workflow
    test_pdf_quality
    
    echo -e "${GREEN}🎉 All E2E tests completed!${NC}"
}

main "$@"
