# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a personal developer notes repository containing comprehensive technical documentation across multiple topics. The notes cover:

- Python tooling and package management (UV, pip, pytest, aiohttp)
- Django web framework (models, migrations, templates, ORM, MVT architecture)
- AWS Cloud Practitioner certification (IAM, EC2, regions, availability zones)
- Python testing (pytest, capsys, pytest.raises)
- macOS development tools (Homebrew, Tart virtualization)
- NotebookLM (Google's AI research tool)
- Article bookmarks and learning resources

## Repository Structure

The repository contains focused, modular markdown documentation files:

### Documentation Files (8 files)

- `article_bookmarks.md` (1.3K) - Curated learning resource links
- `aws.md` (24K) - AWS Cloud Practitioner certification study notes
- `django.md` (48K) - Comprehensive Django web framework documentation
- `macos_dev.md` (658B) - Homebrew and Tart virtualization
- `notebooklm.md` (1.3K) - Google's AI research tool
- `python_misc.md` (11K) - Python distributions, PyPI, macOS integration
- `python_testing.md` (2.3K) - pytest fixtures and testing patterns
- `uv.md` (40K) - UV Python package manager (extensive coverage)

### Meta Files

- `CLAUDE.md` - This file, providing guidance for working with the repository

## Document Organization

All markdown files use standard markdown headers:

1. **H1 headers (`#`)** - Top-level section (one per file)
   - Examples: "# Django", "# AWS", "# UV"

2. **H2 headers (`##`)** - Second-level sections (subtopics)
   - Example: "## UV Project", "## Django Commands", "## IAM"

3. **H3 headers (`###`)** - Third-level sections (detailed subsections)
   - Example: "### Auto Reload", "### Foreign Key", "### IAM Roles"

4. **H4 headers (`####`)** - Fourth-level sections (specific details)
   - Example: "#### yum update -y", "#### Delete on Termination attribute"

## Formatting Conventions

### Bullet Points

- Use asterisk (`*`) for all bullet points (not dashes `-`)
- Add blank lines between top-level bullet points for readability
- Nest sub-bullets with proper indentation (4 spaces)
- Example:
  ```markdown
  * Main point with detailed explanation

  * Another main point

      * Sub-point with more detail

      * Another sub-point
  ```

### Code Formatting

- Use inline code formatting for:
  - Commands: `` `uv run` ``, `` `git status` ``
  - File paths: `` `~/.cache/uv/` ``
  - Configuration values: `` `DEBUG=True` ``
  - AWS region names: `` `us-east-1` ``, `` `ap-southeast-2a` ``

- Use code blocks for:
  - Multi-line code examples
  - Shell commands
  - Configuration snippets
  - Specify language when applicable: ` ```bash `, ` ```python `, ` ```html `

### Section Spacing

- Add `<br>` tags between major sections for visual separation
- Use blank lines generously between bullet points for readability
- Keep related content grouped together

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
- macOS System Python and user-specific package locations
- Framework vs. non-framework builds
- sys.path and PYTHONPATH
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

- **macOS Dev** (658B) - Homebrew installation and Tart virtualization setup
- **NotebookLM** (1.3K) - Google's AI research tool capabilities and use cases
- **Article Bookmarks** (1.3K) - Links to Python, Django, and AWS learning resources

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

### Adding New Content

- Add content to the appropriate existing `.md` file based on topic
- Follow the established formatting conventions (asterisk bullets, spacing, inline code)
- Use proper markdown headers (H2 for major topics, H3 for subtopics, H4 for details)
- Add section breaks (`<br>`) between major topics for visual clarity

### No Build/Test Commands

This repository contains documentation only - there are no build, test, or lint commands to run.

### Repository Evolution Note

This repository originally started as a `.zshrc` shell configuration file and evolved into comprehensive developer documentation. Previous formats (dev_notes.sh, dev_notes.md) and some split files have been consolidated into the current 8 focused markdown files.
