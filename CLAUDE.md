# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a personal developer notes repository containing comprehensive technical documentation across multiple topics. The notes cover:

- Python tooling and package management (UV, pip, pytest, aiohttp)
- Django web framework (models, migrations, templates, ORM, MVT architecture)
- AWS Cloud Practitioner certification (IAM, EC2, S3, databases, compute services)
- Python testing (pytest, capsys, pytest.raises)
- macOS development tools (Homebrew, Tart virtualization)
- NotebookLM (Google's AI research tool)
- Article bookmarks and learning resources

## Repository Structure

The repository contains focused, modular markdown documentation files:

### Documentation Files

**Root Level:**
- `article_bookmarks.md` (1.3K) - Curated learning resource links
- `django.md` (48K) - Comprehensive Django web framework documentation
- `macos_dev.md` (658B) - Homebrew and Tart virtualization
- `notebooklm.md` (1.3K) - Google's AI research tool
- `python_misc.md` (11K) - Python distributions, PyPI, macOS integration
- `python_testing.md` (2.3K) - pytest fixtures and testing patterns
- `uv.md` (40K) - UV Python package manager (extensive coverage)

**AWS Directory (`aws/`):**
- `1-aws-global-infra.md` (776B) - Regions, Availability Zones, Edge Locations
- `2-iam.md` (2.1K) - IAM users, groups, roles, policies
- `3-ec2.md` (23K) - EC2 instances, storage, AMI, ELB/ASG
- `4-s3.md` (6.8K) - S3 buckets, objects, security, storage classes
- `5-databases.md` (9.7K) - RDS, Aurora, DynamoDB, Redshift, EMR, Glue
- `6-other-compute.md` (3.4K) - ECS, Fargate, Lambda, API Gateway, Batch
- `7-deploying-and-managing.md` (4.6K) - Deployment and management services
- `8-global-applications.md` (5.7K) - CloudFront, Route 53, global application architecture
- `9-cloud-integration.md` (9.2K) - SQS, SNS, Kinesis, messaging patterns
- `10-cloud-monitoring.md` (11K) - CloudWatch, EventBridge, CloudTrail, X-Ray
- `11-vpc.md` (4.9K) - VPC, subnets, security groups, networking

**Other Directories:**
- `assets/` - Screenshots and images referenced in documentation

### Meta Files

- `CLAUDE.md` - This file, providing guidance for working with the repository

## Document Organization

All markdown files use standard markdown headers:

1. **H1 headers (`#`)** - Top-level section (one per file, or major topics in split files)
   - Examples: "# Django", "# AWS", "# IAM"

2. **H2 headers (`##`)** - Second-level sections (major subtopics)
   - Example: "## UV Project", "## Django Commands", "## RDS"

3. **H3 headers (`###`)** - Third-level sections (detailed subsections)
   - Example: "### Auto Reload", "### Foreign Key", "### Buckets"

4. **H4 headers (`####`)** - Fourth-level sections (specific details)
   - Example: "#### Standard - General Purpose", "#### yum update -y"

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

### Images and Assets

- Store images in the `assets/` directory
- Reference images using relative paths: `![Description](assets/filename.png)`
- Use descriptive filenames for images

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

### AWS (Cloud Practitioner) - Split across 11 files (~82K total)

AWS Cloud Practitioner certification notes organized by topic:

**1. Global Infrastructure** - Regions, Availability Zones, Edge Locations

**2. IAM** - Users, Groups, Roles, Policies, Password policies, MFA, Security tools

**3. EC2** - Instance types, User Data scripts, Security Groups, Purchasing options, EBS storage, EFS, AMI, EC2 Image Builder, ELB, ASG

**4. S3** - Buckets, Objects, Security, Versioning, Replication, Storage Classes, IAM Access Analyzer, Snowball, Storage Gateway

**5. Databases** - RDS, Aurora, ElastiCache, DynamoDB, Redshift, EMR, Athena, QuickSight, DocumentDB, Neptune, Timestream, Managed Blockchain, Glue, Database Migration Service

**6. Other Compute** - ECS, Fargate, ECR, EKS, API Gateway, Lambda, Batch

**7. Deploying and Managing** - Deployment and infrastructure management services

**8. Global Applications** - CloudFront CDN, Route 53 DNS, global application architecture patterns

**9. Cloud Integration** - SQS (queue service), SNS (notification service), Kinesis (streaming), messaging patterns

**10. Cloud Monitoring** - CloudWatch (metrics/logs/alarms), EventBridge (events), CloudTrail (audit), X-Ray (tracing)

**11. VPC** - Virtual Private Cloud, subnets, security groups, NACLs, VPN, Direct Connect, networking fundamentals

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

- **For AWS topics**: Add to the appropriate file in the `aws/` directory based on service category
- **For other topics**: Add to the appropriate root-level `.md` file based on topic
- Follow the established formatting conventions (asterisk bullets, spacing, inline code)
- Use proper markdown headers (H2 for major topics, H3 for subtopics, H4 for details)
- Add section breaks (`<br>`) between major topics for visual clarity
- Store images in `assets/` directory and reference them with relative paths

### No Build/Test Commands

This repository contains documentation only - there are no build, test, or lint commands to run.

### Repository Evolution Note

This repository originally started as a `.zshrc` shell configuration file and evolved into comprehensive developer documentation. The AWS documentation was recently reorganized from a single large file into a modular directory structure for better organization and maintainability.
