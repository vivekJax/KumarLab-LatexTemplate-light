#!/bin/bash

# =============================================================================
# LaTeX Template Continuous Testing
# =============================================================================
# 
# Created by: Kumar Lab, The Jackson Laboratory
# GitHub: https://github.com/kumarlabjax/LaTeX-Template
# 
# This script watches for file changes and automatically runs tests
# whenever the code is modified.
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
PROJECT_ROOT="$(dirname "$TEST_DIR")"

print_header() {
    echo -e "${BLUE}=============================================================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}=============================================================================${NC}"
}

print_change() {
    echo -e "${YELLOW}📝 File changed: $1${NC}"
    echo -e "${YELLOW}🔄 Running tests...${NC}"
}

print_success() {
    echo -e "${GREEN}✅ Tests passed!${NC}"
}

print_failure() {
    echo -e "${RED}❌ Tests failed!${NC}"
}

# Check if entr is available
if ! command -v entr &> /dev/null; then
    echo -e "${RED}❌ Error: 'entr' command not found${NC}"
    echo -e "${YELLOW}Please install entr: brew install entr${NC}"
    exit 1
fi

print_header "LaTeX TEMPLATE CONTINUOUS TESTING"
echo -e "${BLUE}Watching for file changes...${NC}"
echo -e "${BLUE}Press Ctrl+C to stop${NC}"
echo ""

# Watch for changes and run tests
find "$PROJECT_ROOT" -name "*.tex" -o -name "*.sty" -o -name "*.sh" -o -name "*.md" | \
entr -r bash -c '
    echo -e "\033[1;33m📝 Files changed - running tests...\033[0m"
    if ./tests/run_tests.sh; then
        echo -e "\033[0;32m✅ All tests passed!\033[0m"
    else
        echo -e "\033[0;31m❌ Some tests failed!\033[0m"
    fi
    echo ""
    echo -e "\033[0;34m👀 Watching for changes...\033[0m"
'
