# Real-world Experiences with AI-Assisted Development

A practical, experience-based presentation about patterns and anti-patterns in AI-assisted software development.

## Overview

This talk is designed as a **field report**, not a hype talk. It covers:
- 6 practical patterns that keep teams fast and safe
- 6 anti-patterns that quietly hurt productivity
- Actionable takeaways for immediate team adoption

**Duration**: ~30-40 minutes (including Q&A)

## Prerequisites

You can use this presentation in **two ways**:

### Option A: VS Code Extension (Recommended for Editing)

1. **Install VS Code** from [code.visualstudio.com](https://code.visualstudio.com/)

2. **Install Marp for VS Code extension**
   - Open VS Code
   - Go to Extensions (Cmd+Shift+X / Ctrl+Shift+X)
   - Search for "Marp for VS Code"
   - Install the extension by Marp Team

3. **That's it!** No additional dependencies needed.

### Option B: Marp CLI (For Command-Line Export)

1. **Node.js** (v16 or higher)
   - Check: `node --version`
   - Install from [nodejs.org](https://nodejs.org/)

2. **Marp CLI**
   ```bash
   npm install -g @marp-team/marp-cli
   ```

3. **Verify Installation**
   ```bash
   marp --version
   ```
   You should see output like `@marp-team/marp-cli v3.x.x`

### Which Option Should I Choose?

- **Use VS Code Extension** if you want to:
  - Edit and preview slides in real-time
  - See live updates as you type
  - Use a familiar editor interface
  
- **Use Marp CLI** if you need to:
  - Export from command line or scripts
  - Integrate with CI/CD pipelines
  - Batch process multiple presentations

- **Use Both** for the best experience: edit in VS Code, export with CLI

## Quick Start

### Using the Runner Script (Easiest)

A convenience script is provided for quick access to common tasks:

```bash
./present.sh           # Start live preview (default)
./present.sh preview   # Same as above
./present.sh html      # Generate HTML file
./present.sh pdf       # Generate PDF file
./present.sh open      # Open generated HTML in browser
./present.sh clean     # Remove generated files
./present.sh help      # Show all commands
```

**Quick shortcuts:**
- `./present.sh p` → preview
- `./present.sh w` → watch mode (no browser)
- `./present.sh h` → generate HTML
- `./present.sh o` → open HTML

### Using VS Code Extension

1. **Open the presentation**
   - Open this folder in VS Code
   - Open `presentation.md`

2. **Preview slides**
   - Click the "Open Preview to the Side" button in the top-right corner (or use Cmd+K V / Ctrl+K V)
   - You'll see a live preview of your slides that updates as you edit

3. **Navigate the preview**
   - Click through slides in the preview pane
   - Scroll in the editor to see different slides
   - The preview syncs with your cursor position

4. **Export from VS Code**
   - Click the Marp icon in the editor toolbar
   - Choose "Export Slide Deck..."
   - Select format: HTML, PDF, or PowerPoint
   - Choose output location

5. **Present directly from preview**
   - In the preview pane, click the "Open in Browser" icon
   - Press `F` for fullscreen, `P` for presenter mode

### Using Marp CLI

1. **Preview the presentation**

   Start a live preview server that auto-reloads on changes:

   ```bash
   marp --preview presentation.md
   ```

   This opens your browser at `http://localhost:8080` with live updates.

2. **Export to HTML**

   Generate a standalone HTML file for presenting:

   ```bash
   marp presentation.md -o presentation.html
   ```

   The generated `presentation.html` can be opened in any browser and includes:
   - All slides
   - Navigation controls
   - Speaker notes (press `P` key)
   - Touch/swipe support for tablets

3. **Export to PDF**

   For handouts or sharing:

   ```bash
   marp presentation.md -o presentation.pdf --allow-local-files
   ```

## Presentation Tips

### Navigation

- **Arrow keys** or **Space**: Next slide
- **Shift + Arrow** or **Backspace**: Previous slide
- **P key**: Toggle presenter mode (shows speaker notes)
- **F key**: Toggle fullscreen
- **Click/tap**: Advance slides

### Using Speaker Notes

Each slide has detailed speaker notes embedded in the markdown. To view them:

1. Open `presentation.html` in your browser
2. Press **P** to enter presenter mode
3. You'll see current slide, next slide, and notes

### Customizing for Your Audience

The presentation is designed to be adaptable. Consider:

1. **Tech Stack Examples**: Replace generic examples in speaker notes with your team's actual stack
2. **Story Time**: Slides 255 (spike sanitization) and others reference "share a story"—prepare 1-2 real examples from your experience
3. **Q&A Prompts**: The final slide suggests conversation starters; add your own based on audience

### Presentation Flow

```
Introduction (3 slides, ~3-5 min)
  └─ Set expectations: practical, not hype

Patterns (6 slides, ~15-18 min)
  └─ ~2-3 minutes per pattern
  └─ Use examples from speaker notes

Anti-patterns (6 slides, ~12-15 min)
  └─ ~2 minutes per anti-pattern
  └─ These are shorter; audience will recognize them quickly

Synthesis (2 slides, ~3-5 min)
  └─ Putting it together
  └─ Actionable next steps

Q&A (remaining time)
```

## Customization

### Changing the Theme

The presentation uses Marp's `gaia` theme. To change it, edit `presentation.md`:

```markdown
---
theme: gaia  # Options: default, gaia, uncover
---
```

### Adding Your Own Branding

Add a custom CSS section to `presentation.md`:

```markdown
---
marp: true
theme: gaia
style: |
  section {
    background-color: #your-brand-color;
  }
---
```

### Modifying Images

All images are in `/images/` and are hand-drawn pencil illustrations. Each slide's markdown includes:
- The image filename
- The original prompt used to generate it (for reference/regeneration)

To replace an image, simply swap the file in `/images/` keeping the same filename.

## File Structure

```
.
├── presentation.md          # Main presentation source (Marp markdown)
├── presentation.html        # Generated HTML (for presenting)
├── images/                  # Slide illustrations
│   ├── compass.png
│   ├── lighthouse.png
│   ├── bridge.png
│   └── ... (15 total)
└── README.md               # This file
```

## Advanced Options

### Watch Mode (for editing)

```bash
marp --watch presentation.md
```

Generates HTML on every save (without opening browser).

### Custom Server Port

```bash
marp --preview --preview-port 3000 presentation.md
```

### High-Quality PDF Export

```bash
marp presentation.md -o presentation.pdf --allow-local-files --pdf-outline
```

Includes PDF bookmarks for easy navigation.

## Troubleshooting

### VS Code Extension Issues

**Extension not showing preview**
- Make sure you've installed "Marp for VS Code" (not other markdown extensions)
- Try reloading VS Code (Cmd+Shift+P / Ctrl+Shift+P → "Reload Window")
- Check that the file is named `.md` and contains `marp: true` in the front matter

**Images not showing in VS Code preview**
- Ensure image paths are relative to the markdown file
- VS Code extension loads images automatically—no special flags needed

**Export button is grayed out**
- The file must be recognized as a Marp presentation (check for `marp: true` in front matter)
- Try closing and reopening the file

**Export to PDF requires Chrome/Chromium**
- VS Code extension uses your system's Chrome/Chromium for PDF export
- Install Chrome if PDF export fails
- Alternatively, export to HTML first, then print to PDF from your browser

### Marp CLI Issues

**Images Not Showing**
- **In preview**: Images should load automatically
- **In exported HTML**: Ensure `images/` folder is in the same directory as the HTML file
- **In PDF**: Use `--allow-local-files` flag

**Marp CLI Not Found**
```bash
# Check if installed globally
npm list -g @marp-team/marp-cli

# Reinstall if needed
npm install -g @marp-team/marp-cli
```

**Browser Shows Raw Markdown**
You may have opened `presentation.md` directly. Instead:
1. Run `marp presentation.md -o presentation.html`
2. Open `presentation.html` in your browser

### General Issues

**Slides look different between preview and export**
- Both VS Code extension and CLI use the same rendering engine
- Differences usually come from browser rendering or missing fonts
- Test exported files in the browser you'll use for presenting

## Feedback & Iteration

After presenting, consider:
- Which examples resonated most?
- Which anti-patterns got the biggest nods of recognition?
- What questions came up in Q&A?

Use this to refine the talk for next time.

## License

Feel free to adapt and remix for your own presentations. Attribution appreciated but not required.

## Resources

- [Marp Documentation](https://marpit.marp.app/)
- [Marp CLI Documentation](https://github.com/marp-team/marp-cli)
- [Markdown Guide](https://www.markdownguide.org/)

