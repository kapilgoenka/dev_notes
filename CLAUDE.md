# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a personal developer notes repository containing comprehensive technical documentation across multiple topics. The notes cover:

- Python tooling and package management (UV, pip, pytest, aiohttp)
- Node.js version management (NVM)
- Django web framework (models, migrations, templates, ORM, MVT architecture)
- macOS system architecture (framework builds, system protection, user directories)
- Shell configuration patterns for zsh/bash
- Development tools (Docker, Homebrew, Tart)
- AWS (Cloud Practitioner certification topics, IAM, EC2, regions, availability zones)
- Python testing (pytest, capsys, pytest.raises)
- NotebookLM
- Article bookmarks and learning resources

## Repository Structure

The repository has evolved significantly and now contains documentation in multiple formats:

### Primary Documentation Files

**Markdown Format (Modular):**
- `intro.md` (484B) - Repository introduction and origin story
- `nodejs.md` (778B) - NodeJS and NVM installation/configuration
- `docker.md` (195B) - Docker Desktop CLI completions
- `uv.md` (40K) - UV Python package manager (extensive coverage)
- `python_misc.md` (11K) - Python distributions, PyPI, macOS integration
- `python_testing.md` (2.3K) - pytest fixtures and testing patterns
- `notebooklm.md` (1.2K) - Google's AI research tool
- `macos_dev.md` (640B) - Homebrew and Tart virtualization
- `aliases.md` (126B) - Shell aliases for git, python, ssh
- `django.md` (48K) - Comprehensive Django web framework documentation
- `aws.md` (24K) - AWS Cloud Practitioner certification study notes
- `article_bookmarks.md` (1.3K) - Learning resource links

**Combined Formats:**
- `dev_notes.md` (130K, 3391 lines) - Full markdown version with all content combined
- `dev_notes.sh` (~3300 lines) - Original shell script format with comments

**Meta Files:**
- `CLAUDE.md` - This file, providing guidance for working with the repository

### File Relationships

- The individual `.md` files are split from `dev_notes.md` by top-level (H1) sections
- `dev_notes.md` was converted from `dev_notes.sh`
- `dev_notes.sh` is the original format that began as a `.zshrc` file
- All three formats (shell script, combined markdown, split markdown) contain the same content in different organizations

## Document Organization

### Markdown Files Structure

The markdown files use standard markdown headers:

1. **H1 headers (`#`)** - Top-level sections (major topics)
   - One per individual file when split
   - Examples: "# NodeJS", "# Django", "# AWS"

2. **H2 headers (`##`)** - Second-level sections (subtopics)
   - Example: "## UV Project", "## Django Commands"

3. **H3 headers (`###`)** - Third-level sections (detailed subsections)
   - Example: "### Auto Reload", "### Foreign Key", "### IAM Roles"

### Shell Script Format (dev_notes.sh)

The shell script follows a three-level header hierarchy using comment decorations:

1. **Top-level sections** (4 rows of `#` above and below title):
   - Preceded by 5 empty rows
   - Format: 8 rows of `#` with centered title
   - Example: `######## NodeJS ########`

2. **Second-level sections** (1 row of `#` above and below title):
   - Preceded by 3 empty rows
   - Example: `### UV Project ###`

3. **Third-level sections** (1 row of `-` above and below title):
   - **Spacing rule**: Preceded by exactly 1 blank line (not 2 or more)
   - **Hyphen formatting rule**: Hyphens must extend exactly 2 characters beyond the text length on each side
   - Example: "Variables" (9 chars) requires 13 hyphens (9+2+2)
   - Example: "Auto Reload" (11 chars) requires 15 hyphens (11+2+2)
   - Format:
     ```
     # Previous content here

     # ---------------
     # Auto Reload
     # ---------------
     ```

## Formatting Rules for dev_notes.sh

### Line Length Requirements

**Critical formatting rule: 88 character line length limit**

- Regular comment text must wrap at 88 characters
- **Exceptions that may exceed 88 chars:**
  - Lines containing only commands (starting with `$`, `uv`, `python`, `git`, etc.)
  - Lines containing only file paths
  - URLs (http:// or https://)
  - ASCII table rows (containing box-drawing characters: ┌ ├ └ │ ┬ ┼ ┴ ─ ┐ ┤ ┘)

### Content Structure Patterns

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

4. **Visual diagrams** use ASCII art with box-drawing for complex concepts:
   - Used extensively in UV section to explain temporary environments
   - Shows relationships between project .venv, package cache, and temporary environments
   - Includes flowcharts for `uv run --with` behavior

5. **Actual shell configuration** (uncommented):
   - Environment variable exports
   - Path additions
   - Aliases
   - Source commands for loading tools

## File Origin and Evolution

The documentation started as a `.zshrc` configuration file and evolved significantly:

1. **Original**: `.zshrc` shell configuration file on macOS
2. **Evolution**: Became `dev_notes.sh` with extensive educational comments
3. **Conversion**: Converted to `dev_notes.md` markdown format (3391 lines)
4. **Split**: Divided into 13 individual markdown files by topic

The `dev_notes.sh` file contains both:
- **Active shell configuration** (uncommented lines): NVM setup, Docker completions, environment exports
- **Educational documentation** (commented lines): Detailed explanations of Python, Django, UV, and other development concepts

When editing `dev_notes.sh`, preserve this dual nature - some parts are actual shell configuration that loads on terminal startup, while most is educational commentary.

## Major Topic Documentation Coverage

### UV (Python Package Manager) - 40K

Extensive UV package manager documentation includes:
- UV project structure and workflow (locking, syncing)
- UV tools interface (uvx, uv tool install/run)
- Python version management with UV
- Common commands (python, projects, tools, utility)
- pyproject.toml configuration ([project.scripts], [build-system])
- UV cache structure and location (~/.cache/uv/)
- Package cache and temporary environments
- `uv run --with` behavior and temporary environment creation
- Running scripts with inline dependencies
- Build backends (Hatchling, Setuptools, Poetry, Flit)

### Django (Web Framework) - 48K

Comprehensive Django documentation includes:
- Project vs App structure
- MVT (Model-View-Template) architecture
- Auto-reload behavior in development server
- WSGI/ASGI deployment
- Django ORM and models (fields, relationships, migrations)
- Template language (variables, filters, tags, inheritance)
- Settings configuration (DEBUG, ALLOWED_HOSTS, INSTALLED_APPS, TEMPLATES, STATICFILES_DIRS)
- Migration workflow and commands (sqlmigrate)
- HttpRequest/HttpResponse objects
- Enumeration types for model choices (TextChoices)
- DateTimeField with auto_now and auto_now_add
- Foreign keys and composite keys
- Circular relations and lazy relationships
- Default auto-incrementing primary keys (BigAutoField)
- Default indexes (SlugField, Unique fields, ForeignKey)

### AWS (Cloud Practitioner) - 24K

AWS Cloud Practitioner certification notes include:
- AWS global infrastructure (Regions, Availability Zones, Edge Locations)
- IAM (Identity and Access Management):
  - Users, Groups, Roles, and Policies
  - Password policies and MFA
  - IAM Credentials Report and Access Advisor
  - Service roles (EC2, Lambda, CloudFormation)
- EC2 (Elastic Compute Cloud):
  - Instance types and sizing options
  - EC2 User Data scripts for bootstrapping
  - Security Groups (firewall rules, inbound/outbound traffic)
  - Purchasing options (On-Demand, Reserved, Spot, Dedicated)
  - Classic ports (SSH, HTTP, HTTPS, RDP, FTP, SFTP)
  - EBS (Elastic Block Store) volume configuration
  - EC2 instance categories (General Purpose, Compute, Memory, Storage, Accelerated, HPC)
  - EC2 Instance Store and EFS (Elastic File System)
- Linux commands for EC2 (yum, httpd, systemctl)

### Python (Misc) - 11K

Python ecosystem documentation:
- macOS Python framework builds
- Package distribution formats (wheel, sdist)
- PyPI (Python Package Index)
- Rust-based Python tooling (Ruff, UV)
- aiohttp async HTTP library

### Python Testing - 2.3K

pytest documentation:
- capsys fixture for capturing stdout/stderr
- pytest.raises() context manager
- Testing patterns and best practices

### Other Topics

- **NodeJS** (778B) - NVM installation and configuration
- **Docker** (195B) - Docker Desktop CLI completions
- **NotebookLM** (1.2K) - Google's AI research tool
- **macOS Dev** (640B) - Homebrew and Tart virtualization
- **Aliases** (126B) - Shell aliases (git, python, ssh)
- **Article Bookmarks** (1.3K) - Curated learning resources

## Git Workflow

When committing changes:
- Focus commit messages on content additions/improvements
- For formatting-only changes, explicitly mention "formatting" in the message
- All commits include co-authorship footer:
  ```
  🤖 Generated with [Claude Code](https://claude.com/claude-code)

  Co-Authored-By: Claude <noreply@anthropic.com>
  ```

## Working with the Repository

### Which File to Edit?

- **For new content**: Add to the appropriate individual `.md` file (e.g., `django.md`, `aws.md`)
- **For shell configuration**: Edit `dev_notes.sh` and maintain both uncommented config and commented documentation
- **For combined view**: The full content is in `dev_notes.md` but editing individual files is preferred

### No Build/Test Commands

This repository contains documentation only - there are no build, test, or lint commands to run.

### File Synchronization

Currently, the three formats (shell script, combined markdown, split markdown files) are **not automatically synchronized**. When editing:
- If you edit `dev_notes.sh`, the markdown files won't update automatically
- If you edit individual `.md` files, `dev_notes.md` and `dev_notes.sh` won't update automatically
- Manual synchronization or regeneration may be needed if keeping all formats in sync
