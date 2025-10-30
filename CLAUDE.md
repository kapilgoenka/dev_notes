# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a personal developer notes repository containing a single comprehensive shell script (`dev_notes.sh`) with detailed explanations of macOS development environment configuration. The notes primarily cover:

- Python tooling and package management (UV, pip, pyenv)
- Node.js version management (NVM)
- macOS system architecture (framework builds, system protection, user directories)
- Shell configuration patterns for zsh/bash
- Development tools (Docker, Homebrew, Tart, pytest, aiohttp)

## File Structure

- `dev_notes.sh` - Main documentation file structured as an annotated shell configuration script with extensive comments explaining each concept

## Working with This Repository

### Understanding the File Format

The `dev_notes.sh` file uses a specific structure:
- Section headers with `#####` delimiters
- Detailed explanatory comments for each concept
- Example commands shown in comments
- Actual shell configuration snippets (exports, aliases, source commands)
- Verification commands provided as comments for testing concepts

### Making Edits

When editing `dev_notes.sh`:
- Maintain the existing section header format with `#####` delimiters
- Keep explanatory comments comprehensive and beginner-friendly
- Include verification commands where applicable
- Preserve the narrative flow that explains "why" not just "what"
- Follow the pattern: concept introduction → characteristics → usage → examples
- Add examples of actual shell commands in comments (prefixed with `#`)

### Content Philosophy

The notes follow these principles:
- Explain underlying concepts, not just commands
- Provide context about why things work the way they do on macOS
- Include verification steps to test understanding
- Document installation sources and official documentation links
- Explain relationships between tools (e.g., "Homebrew vs UV", "Framework vs Non-Framework builds")

### No Build/Test Commands

This repository contains documentation only - there are no build, test, or lint commands to run.
