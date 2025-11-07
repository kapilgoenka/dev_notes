# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a personal developer notes repository containing a single comprehensive shell script (`dev_notes.sh`) with detailed technical documentation. The notes cover:

- Python tooling and package management (UV, pip, pytest, aiohttp)
- Node.js version management (NVM)
- Django web framework (models, migrations, templates, ORM, MVT architecture)
- macOS system architecture (framework builds, system protection, user directories)
- Shell configuration patterns for zsh/bash
- Development tools (Docker, Homebrew, Tart)

## File Structure

- `dev_notes.sh` - Main documentation file (131KB+) structured as an annotated shell configuration script with extensive comments
- `CLAUDE.md` - This file, providing guidance for working with the repository

## Document Architecture

The `dev_notes.sh` file follows a three-level header hierarchy:

1. **Top-level sections** (4 rows of `#` above and below title):
   - Preceded by 5 empty rows
   - Major topics like NodeJS, Docker, UV, Python, Django
   - Format: 8 rows of `#` with centered title

2. **Second-level sections** (1 row of `#` above and below title):
   - Preceded by 3 empty rows
   - Subtopics within major sections
   - Example: "Django Commands", "UV Project", "Homebrew vs UV"

3. **Third-level sections** (1 row of `-` above and below title):
   - Preceded by 2 empty rows
   - Detailed subsections
   - Example: "Variables", "Filters", "Tags" under Django Templates

## Line Length Requirements

**Critical formatting rule: 88 character line length limit**

- Regular comment text must wrap at 88 characters
- **Exceptions that may exceed 88 chars:**
  - Lines containing only commands (starting with `$`, `uv`, `python`, `git`, etc.)
  - Lines containing only file paths
  - URLs (http:// or https://)
  - ASCII table rows (containing box-drawing characters: ┌ ├ └ │ ┬ ┼ ┴ ─ ┐ ┤ ┘)

## Content Structure Patterns

When adding content to `dev_notes.sh`:

1. **Explanatory sections** follow this pattern:
   - Concept introduction and definition
   - Characteristics or properties
   - Practical usage examples
   - Verification commands (when applicable)
   - Related tools or concepts

2. **Code examples** are shown as comments:
   ```bash
   # Example command:
   # uv run manage.py runserver
   ```

3. **Tables** use ASCII box-drawing characters:
   ```
   # ┌────────────────┬──────────────────┐
   # │ Command        │ Description      │
   # ├────────────────┼──────────────────┤
   # │ uv run         │ Execute command  │
   # └────────────────┴──────────────────┘
   ```

4. **Actual shell configuration** (uncommented):
   - Environment variable exports
   - Path additions
   - Aliases
   - Source commands for loading tools

## Django Documentation Coverage

Extensive Django documentation includes:
- Project vs App structure
- MVT (Model-View-Template) architecture
- Django ORM and models (fields, relationships, migrations)
- Template language (variables, filters, tags, inheritance)
- Settings configuration (DEBUG, ALLOWED_HOSTS, INSTALLED_APPS, TEMPLATES, STATICFILES_DIRS)
- Migration workflow and commands
- HttpRequest/HttpResponse objects
- Enumeration types for model choices
- Foreign keys and composite keys
- Circular relations and lazy relationships

## Git Workflow

When committing changes:
- **Never mention formatting changes** in commit messages
- Focus commit messages on content additions/improvements
- All commits include co-authorship footer:
  ```
  🤖 Generated with [Claude Code](https://claude.com/claude-code)

  Co-Authored-By: Claude <noreply@anthropic.com>
  ```

## No Build/Test Commands

This repository contains documentation only - there are no build, test, or lint commands to run.
