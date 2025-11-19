#!/usr/bin/env bash
# Marp Presentation Runner Script
# This script provides convenient commands for working with the presentation

set -e

PRESENTATION_FILE="presentation.md"
HTML_OUTPUT="presentation.html"
PDF_OUTPUT="presentation.pdf"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if Marp CLI is installed
check_marp() {
    if ! command -v marp &> /dev/null; then
        echo -e "${RED}Error: Marp CLI is not installed.${NC}"
        echo "Install it with: npm install -g @marp-team/marp-cli"
        exit 1
    fi
}

# Function to show usage
usage() {
    cat << EOF
Usage: $0 [command]

Commands:
    preview, p       Open live preview in browser with auto-reload
    watch, w         Watch for changes and rebuild HTML (no browser)
    html, h          Export to HTML (one-time)
    pdf              Export to PDF (one-time)
    open, o          Open the generated HTML in browser
    clean, c         Remove generated files
    help             Show this help message

Examples:
    $0 preview       # Start live preview
    $0 html          # Generate HTML file
    $0 pdf           # Generate PDF file
    $0 clean         # Remove generated files

If no command is provided, defaults to 'preview'.
EOF
}

# Preview mode with live reload
preview() {
    check_marp
    echo -e "${GREEN}Starting live preview...${NC}"
    echo "Press Ctrl+C to stop"
    marp --preview "$PRESENTATION_FILE"
}

# Watch mode without browser
watch() {
    check_marp
    echo -e "${GREEN}Watching for changes...${NC}"
    echo "Will regenerate HTML on each save"
    echo "Press Ctrl+C to stop"
    marp --watch "$PRESENTATION_FILE"
}

# Export to HTML
export_html() {
    check_marp
    echo -e "${GREEN}Generating HTML...${NC}"
    marp "$PRESENTATION_FILE" -o "$HTML_OUTPUT"
    echo -e "${GREEN}✓ Generated: $HTML_OUTPUT${NC}"
}

# Export to PDF
export_pdf() {
    check_marp
    echo -e "${GREEN}Generating PDF...${NC}"
    marp "$PRESENTATION_FILE" -o "$PDF_OUTPUT" --allow-local-files
    echo -e "${GREEN}✓ Generated: $PDF_OUTPUT${NC}"
}

# Open HTML in browser
open_html() {
    if [ ! -f "$HTML_OUTPUT" ]; then
        echo -e "${YELLOW}HTML file not found. Generating...${NC}"
        export_html
    fi
    
    echo -e "${GREEN}Opening $HTML_OUTPUT in browser...${NC}"
    
    # Detect OS and use appropriate command
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "$HTML_OUTPUT"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open "$HTML_OUTPUT"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        start "$HTML_OUTPUT"
    else
        echo -e "${YELLOW}Unable to detect OS. Please open $HTML_OUTPUT manually.${NC}"
    fi
}

# Clean generated files
clean() {
    echo -e "${YELLOW}Cleaning generated files...${NC}"
    rm -f "$HTML_OUTPUT" "$PDF_OUTPUT"
    echo -e "${GREEN}✓ Cleaned${NC}"
}

# Main command router
case "${1:-preview}" in
    preview|p)
        preview
        ;;
    watch|w)
        watch
        ;;
    html|h)
        export_html
        ;;
    pdf)
        export_pdf
        ;;
    open|o)
        open_html
        ;;
    clean|c)
        clean
        ;;
    help|--help|-h)
        usage
        ;;
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        echo
        usage
        exit 1
        ;;
esac

