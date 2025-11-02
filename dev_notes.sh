########################################################################################
########################################################################################
########################################################################################
########################################################################################
######################################## NodeJS ########################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################

########################################################################################
######################################### NVM ##########################################
########################################################################################

# When you install nvm using its standard installation script, it automatically
# appends these lines to your shell configuration file (.zshrc for zsh, .bashrc
# for bash, etc.) so that nvm is available every time you open a new terminal.

# These lines need to be in your .zshrc because nvm is actually a shell function,
# not a binary executable, so it must be loaded into each shell session.

# Install URL:
# https://github.com/nvm-sh/nvm?tab=readme-ov-file#manual-upgrade

# Install / Update Cmd:
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # nvm bash_completion



########################################################################################
########################################################################################
########################################################################################
########################################################################################
######################################## Docker ########################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################

########################################################################################
################################ Docker CLI Completions ################################
########################################################################################

# The following lines have been added by Docker Desktop to enable Docker CLI
# completions.

fpath=(/Users/kapil/.docker/completions $fpath)
autoload -Uz compinit
compinit



########################################################################################
########################################################################################
########################################################################################
########################################################################################
###################################### macOS Dev #######################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################



########################################################################################
################################ macOS System Python ###################################
########################################################################################

# macOS System Python refers to the python installed by Xcode Command Line Tools.

# This python instllation is a 'framework' build.

# This can be verified by running the command below. If it returns an empty string
# or None, it's not a framework build. If it returns a value (like 'Python' or
# 'Python3'), it's a framework build.
# python3 -c "import sysconfig; print(sysconfig.get_config_var('PYTHONFRAMEWORK'))"
# Python3

# To see where the Python framework is actually installed, run:
# python3 -c "import sys; print(sys.prefix)"
# /Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9

# You can find the REAL Python executable at something like:
# /Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/bin/python3

# You can check what executables Apple actually included with their Python
# installation by running:
# ls -la /Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/bin/




########################################################################################
############### [macOS System Python] User-Specific Package Location ###################
########################################################################################

# MacOS comes with /usr/bin/python3 and /usr/bin/pip3 pre-installed.

# They are actually small "shim" binaries provided by Apple's xcode-select system.
#
# Besides these, many common developer tools in /usr/bin, such as git, swiftc, and
# clang, are also shim binaries.

# This can be confirmed by running:
# otool -L /usr/bin/python3
# /usr/bin/python3:
	# /usr/lib/libxcselect.dylib (compatibility version 1.0.0, current version 1.0.0)
	# /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1356.0.0)

# These shims load libxcselect.dylib to dynamically locate and execute the real
# versions of these tools within the active Xcode or Command Line Tools
# installation. This allows for flexibility in managing multiple Xcode versions
# and ensures that the correct tools are always used. If XCode Command Line Tools
# are not installed, running the shims triggers a popup for install.

# Installing XCode Command Line Tools makes shims like `python3` & `pip3`
# functional. However, upgraging pip using `python3 -m ensurepip --upgrade`
# installs the upgraded version in the location site.USER_BASE, which defaults to
# ~/Library/Python/X.Y for MacOS. Similarly, any packages installed using pip
# (e.g. `pip3 install streamlit`) are also installed in the site.USER_BASE
# location.

# Upon upgrading pip or installing a package, if pip finds that USER_BASE/bin is
# not in $PATH, it asks you add it to $PATH.

# Sequence of steps that led to this export line:
# 1. Xcode Command Line Tools provided Python 3.9
# 2. You ran `python3 -m ensurepip --upgrade` using that python. This command
#    installed pip to your user directory.
# 4. You added the export line to your .zshrc as per output of above command.

export PATH="$HOME/Library/Python/3.9/bin:$PATH"



########################################################################################
####################################### Homebrew #######################################
########################################################################################

# Install Using command here: https://brew.sh

# At the end, the command asked to add the follwoing line to .zprofile.
# Added it to this file (.zshrc) instead.

eval "$(/opt/homebrew/bin/brew shellenv)"



########################################################################################
###################### macOS Virtual Machine Install Using Tart ########################
########################################################################################

# Following steps here:
# https://osxdaily.com/2025/10/06/create-a-macos-tahoe-vm-with-tart

# More about tart
# https://www.linkedin.com/pulse/understanding-tart-virtualization-developer-friendly-tool-singh-f1esc/

# brew install cirruslabs/cli/tart
# tart clone ghcr.io/cirruslabs/macos-tahoe-vanilla:latest my-tahoe-vanilla-vm
# tart run my-tahoe-vanilla-vm



########################################################################################
########################################################################################
########################################################################################
########################################################################################
########################################## UV ##########################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################


# A high-speed package and project manager for Python, written in Rust.

# An all-in-one tool for Python project management:
#   - Install and manage multiple Python versions
#   - Create virtual environments
#   - Efficiently handle project dependencies
#   - Reproduce working environments
#   - Build and publish a project

# UV integrates into one tool most of the functionality provided by tools like
# pip, pip-tools, pipx, poetry, pyenv, twine, virtualenv, and more.

# UV can build and publish Python packages to package repositories like PyPI,
# supporting a streamlined process from development to distribution

# UV can scaffold a full Python project, including the root directory, Git
# repository, virtual environment, pyproject.toml, README, and more.

# When it comes to managing your project's dependencies, uv makes your life easier
# with a clean workflow. This workflow allows you to lock your project's
# dependencies so that other developers can reproduce your environment exactly and
# contribute to your code without much setup effort.



########################################################################################
#################################### Homebrew vs UV ####################################
########################################################################################

# Homebrew and UV are fundamentally different tools that serve different purposes.

# Homebrew is a general-purpose package manager for macOS, while UV is a
# python-specific package and project manager. You would use Homebrew to install
# system-level tools, including UV itself, while UV is used for managing Python
# packages and projects, a task traditionally handled by pip.



########################################################################################
################################### UV Install Cmd #####################################
########################################################################################

# curl -LsSf https://astral.sh/uv/install.sh | sh



########################################################################################
################################## UV Path Additions ###################################
########################################################################################

# This line sources (executes) a script called `env` located in your $HOME/.local/bin/
# directory.

# It is added by the UV install command, both to .zshrc and .bashrc

# The file ~/.local/bin/env is a shell script created by the uv installer to
# manage the PATH environment variable.

# When uv is installed, it places its executables (like uv itself, uvx, env, and
# env.fish) into the ~/.local/bin directory by default.

# The `env` script ensures that ~/.local/bin is added to your PATH if it's not
# already present. This allows you to execute uv and its associated tools directly
# from your terminal without specifying the full path to the executable.

# Breaking it down:

# . - This is the source command (shorthand for source). It executes the script in
# your current shell session rather than in a subshell, meaning any environment
# variables or functions defined in that script will persist in your current shell.

# So essentially, when your shell starts up (since this is in .zshrc), it runs the
# `env` script, which likely sets up environment variables, PATH modifications, or
# other shell configurations. This is a common pattern for keeping your .zshrc
# cleaner by moving some configuration logic into separate files.

. "$HOME/.local/bin/env"



########################################################################################
################################# UV Shell Completion ##################################
########################################################################################

eval "$(uv generate-shell-completion zsh)"



########################################################################################
################################ UV Lock File (uv.lock) ################################
########################################################################################

# A cross-platform lockfile that contains information about your project's
# dependencies. This file ensures that other developers can quickly and exactly
# reproduce your working environment.

# Unlike the pyproject.toml, which is used to specify the broad requirements of
# your project, the lockfile contains the exact resolved versions that are
# installed in the project environment. This file should be checked into version
# control, allowing for consistent and reproducible installations across machines.

# Additionally, it ensures when deploying the project as an application that the
# exact set of used package versions is known.

# The lockfile is automatically created and updated during uv invocations that use
# the project environment, i.e., uv sync and uv run. The lockfile may also be
# explicitly updated using uv lock.

# uv.lock is a human-readable TOML file but is managed by uv and should not be
# edited manually. The uv.lock format is specific to uv and not usable by other
# tools.

# As a counterpart, syncing is the process of installing the required packages
# from the lockfile into the project's development environment.

# Both locking and syncing processes are automatically handled by uv. For example,
# when you execute uv run, the project is locked and synced before the command is
# invoked.

# To see this in action, you can go ahead and remove the .venv/ folder from the
# project's root directory. `uv run` will recreate it.



########################################################################################
################################# UV Common Commands ###################################
########################################################################################

# Python versions
# Installing and managing Python itself.
#
# ┌──────────────────────────┬───────────────────────────────────────────────────┐
# │ Command                  │ Description                                       │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv python install        │ Install Python versions                           │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv python list           │ View available Python versions                    │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv python find           │ Find an installed Python version                  │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv python pin            │ Pin current project to a specific Python version  │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv python uninstall      │ Uninstall a Python version                        │
# └──────────────────────────┴───────────────────────────────────────────────────┘


# Projects
# Creating and working on Python projects, i.e., with a pyproject.toml.
#
# ┌──────────────────────────┬───────────────────────────────────────────────────┐
# │ Command                  │ Description                                       │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv init                  │ Create a new Python project                       │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv add                   │ Add a dependency to the project                   │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv remove                │ Remove a dependency from the project              │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv sync                  │ Sync project's dependencies with the environment  │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv lock                  │ Create a lockfile for project's dependencies      │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv run                   │ Run a command in the project environment          │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv tree                  │ View the dependency tree for the project          │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv build                 │ Build project into distribution archives          │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv publish               │ Publish project to a package index                │
# └──────────────────────────┴───────────────────────────────────────────────────┘


# Tools
# Running and installing tools published to Python package indexes, e.g., ruff or
# black.
#
# ┌──────────────────────────┬───────────────────────────────────────────────────┐
# │ Command                  │ Description                                       │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uvx / uv tool run        │ Run a tool in a temporary environment             │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv tool install          │ Install a tool user-wide                          │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv tool uninstall        │ Uninstall a tool                                  │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv tool list             │ List installed tools                              │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv tool update-shell     │ Update shell to include tool executables          │
# └──────────────────────────┴───────────────────────────────────────────────────┘


# Utility
# Managing and inspecting uv's state, such as the cache, storage directories, or
# performing a self-update.
#
# ┌──────────────────────────┬───────────────────────────────────────────────────┐
# │ Command                  │ Description                                       │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv cache clean           │ Remove cache entries                              │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv cache prune           │ Remove outdated cache entries                     │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv cache dir             │ Show the uv cache directory path                  │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv tool dir              │ Show the uv tool directory path                   │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv python dir            │ Show the uv installed Python versions path        │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv self update           │ Update uv to the latest version                   │
# └──────────────────────────┴───────────────────────────────────────────────────┘



########################################################################################
################ UV pyproject.toml file: [project.scripts] section #####################
########################################################################################

# The [project.scripts] section in the TOML file defines command-line entry points
# that get installed when someone installs your package.

# Example:
# 	[project.scripts]
# 	uv-cats = "main:main"

# This tells the build backend (e.g. Hatchling): "Create a command-line script
# called uv-cats". The script essentially does this:

#   #!/usr/bin/env python
#   # Auto-generated entry point script
# 
#   from main import main
# 
#   if __name__ == '__main__':
# 	  sys.exit(main())

# Without the [project.scripts] section, users would need to know your internal
# module structure in order to run the main.py script. With it, they can just run
# `uv-cats` command, and it works!

# What happens when you install the package?

# Assume package name is 'uv-cats'.
# When someone runs `pip install uv-cats` or `uv tool install uv-cats`, Python
# puts the executable script in their PATH (like /usr/local/bin/uv-cats or similar)




########################################################################################
################# UV pyproject.toml file: [build-system] section #######################
########################################################################################

#   The [build-system] section tells Python packaging tools how to build your
#   package - specifically, which build tool to use and what dependencies it needs.

#   Example configuration:

#   [build-system]
#   requires = ["hatchling"]
#   build-backend = "hatchling.build"

#   This says:
#   1. "To build this package, you need Hatchling installed"
#   2. "Use Hatchling as the build tool"

#   What are build backends?

#   Build backends are tools that know how to:
#   - Read your pyproject.toml
#   - Find your Python files
#   - Create wheel files (.whl)
#   - Create source distributions (.tar.gz)
#   - Install entry points (like our uv-cats command)

#   Common build backends:

#   1. Hatchling
#   	- Modern, fast
#   	- Part of PyPA (Python Packaging Authority)
#   	- Good defaults, minimal configuration

#   2. Setuptools (traditional, most common)
#   	- The oldest and most widely used
#   	- Lots of features and flexibility
#   	- Sometimes requires more configuration

#   3. Poetry
#   	- All-in-one tool (dependency management + building)
#   	- Popular in modern projects

#   4. Flit
#   	- Designed for simplicity
#   	- Best for pure Python packages

#   What happens without [build-system]?

#   If you don't have this section, build tools will fall back to legacy behavior:
#   - Look for a setup.py file
#   - Use setuptools by default
#   - May not work correctly with modern tools like uv or pip


#   [tool.hatch.build.targets.wheel]
#   packages = ["."]

#   Why do we need this?

#   By default, Hatchling expects your code to be in a directory that matches your
#   package name. For example:

#   uv_cats/
#   ├── pyproject.toml
#   └── uv_cats/          # Package directory matching project name
#       ├── __init__.py
#       └── main.py

#   This tells Hatchling: "Include Python files from the current directory (.) in the
#   wheel."



########################################################################################
################################## UV Cache Location ###################################
########################################################################################

# UV cache location: ~/.cache/uv/



########################################################################################
############################# UV Cache Directory Structure #############################
########################################################################################

# (version numbers in sub-directory names may vary)

# ~/.cache/uv/
#   ├── archive-v0/          # Extracted packages (PERSISTENT)
#   │   ├── <hash1>/
#   │   │   └── lib/python3.14/site-packages/requests/
#   │   └── <hash2>/
#   │       └── lib/python3.14/site-packages/urllib3/
#   | 
#   ├── builds-v0/           # Temporary environments (EPHEMERAL)
#   │   └── .tmpXXXXXX/     # Created and deleted per run
#   |
#   ├── wheels-v5/           # Downloaded wheels (PERSISTENT)
#   │   └── <hash>.whl
#   |
#   ├── sdists-v9/           # Downloaded source dists (PERSISTENT)
#   |
#   └── simple-v18/          # PyPI index cache (PERSISTENT)




########################################################################################
############################### UV Package Cache Location ##############################
########################################################################################

#   Downloaded packages are stored in UV's package cache (persistent) and reused:
#      ~/.cache/uv/archive-v0/



########################################################################################
######################### UV Temporary Environments Location ###########################
########################################################################################

#   Temporary environments are created in:
#      ~/.cache/uv/builds-v0/



########################################################################################
##################### Sample UV Temporary Environment Structure ########################
########################################################################################

#   A temporary environment is a full Python virtual environment containing:
#   ~/.cache/uv/builds-v0/
#      .tmpX44ntz/
#         ├── bin/
#         │   ├── python -> python3.14
#         │   ├── python3 -> python3.14
#         │   └── python3.14
#         ├── lib/
#         │   └── python3.14/
#         │       └── site-packages/
#         │           ├── requests/
#         │           ├── urllib3/
#         │           └── ... (dependencies)
#         └── pyvenv.cfg



########################################################################################
################################### `uv run --with` ####################################
########################################################################################

#   `uv run --with` ALMOST ALWAYS creates a temporary environment, even when run inside
#   a UV project! The only expection is when the packages requested in the --with flag
#   are already in the project dependencies (along with compatible version for each).

#   If a temporary environment is used, it's python interpreter's sys.path is configured
#   to include:
#      - Temporary environment location (for the Python interpreter)
#      - Package cache (for --with packages)
#      - Project's .venv/ (for project dependencies)

#   UV uses symlinks from it's package cache to temp environments, so it's extremely
#   fast and doesn't duplicate files. This design makes `uv run --with` perfect for
#   one-off scripts and automation - you get the benefits of isolation without the
#   overhead of managing virtual environments!

#      Traditional virtualenv:
#         python -m venv myenv      # ~2 seconds
#         source myenv/bin/activate
#         pip install requests      # ~5 seconds
#         python script.py
#         deactivate
#         rm -rf myenv              # Manual cleanup
#         # Total: ~7+ seconds

#      UV's approach:
#         uv run --with requests python script.py
#         # First time: ~1 second
#         # Subsequent: ~0.1 seconds ⚡

#   Visual Representation

#         ┌───────────────────────────────────────────┐
#         │ uv run --with black script.py             |
#         │ (inside a UV project)                     |
#         │ (requests ALREADY in project)             │
#         │ (black NOT in project)                    |
#         ├───────────────────────────────────────────┤
#         │                                           │
#         │  ┌─────────────────────────────────────┐  │
#         │  │ Temporary Environment               │  │
#         │  │ ~/.cache/uv/builds-v0/.tmpXXXXXX    │  │
#         │  │                                     │  │
#         │  │ Contains:                           │  │
#         │  │ - Python interpreter (isolated)     │  │
#         │  │ - sys.path configured to find:      │  │
#         │  │   • --with packages (cached)        │  │
#         │  │   • Project packages (.venv)        │  │
#         │  └─────────────────────────────────────┘  │
#         │           │                  │            │
#         │           │                  │            │
#         │           ▼                  ▼            │
#         │  ┌───────────────┐   ┌───────────────┐    │
#         │  │ Project .venv │   │ Package Cache │    │
#         │  │               │   │               │    │
#         │  │ requests      │   │ black         │    │
#         │  └───────────────┘   └───────────────┘    │
#         │   (persistent)       (persistent)         │
#         │                                           │
#         └───────────────────────────────────────────┘

#         ┌─────────────────────────────────────────────┐
#         │ uv run --with "requests==2.31.0" script.py  │
#         │ (inside a UV project)                       │
#         │ (different version requested)               │
#         ├─────────────────────────────────────────────┤
#         │                                             │
#         │   UV checks: Is requests in pyproject.toml? |
#         |      Yes! Is version compatible?            │
#         │      No! Project has >=2.32.5               │
#         │                                             │
#         │   → Create temporary environment            │
#         │   → Install requested version               │
#         │                                             │
#         │   ┌─────────────────────────────────────┐   │
#         │   │ Temporary Environment               │   │
#         │   │ ~/.cache/uv/builds-v0/.tmpXXXXXX    │   │
#         │   │                                     │   │
#         │   │ Contains:                           │   │
#         │   │ - Python interpreter (isolated)     │   │
#         │   │ - sys.path configured to find:      │   │
#         │   │   • --with packages (cached)        │   │
#         │   │   • Project packages (.venv)        │   │
#         │   └─────────────────────────────────────┘   │
#         │           │                  │              │
#         │           │ ← Not used       │ ← Used       │
#         │           ▼                  ▼              │
#         │   ┌───────────────┐   ┌───────────────┐     │
#         │   │ Project .venv │   │ Package Cache │     │
#         │   │               │   │               │     │
#         │   │ requests      │   │ requests      |     │
#         |   | (2.32.5)      |   | (2.31.0)      |     |
#         │   └───────────────┘   └───────────────┘     │
#         │    (persistent)       (persistent)          │
#         └─────────────────────────────────────────────┘


#         ┌───────────────────────────────────────────────────────────┐
#         │ uv run --with requests script.py                          │
#         │ (inside a UV project)                                     │
#         │ (requests with compatible version ALREADY in project)     │
#         ├───────────────────────────────────────────────────────────┤
#         │                                                           │
#         │   UV checks: Is requests in pyproject.toml?               │
#         │      Yes! Version compatible?                             │
#         │      Yes!                                                 │
#         │                                                           │
#         │   → Use existing .venv (optimization!)                    │
#         │   → No temporary environment needed                       │
#         │                                                           │
#         │   ┌─────────────────────────────┐                         │
#         │   │   Project .venv             │                         │
#         │   │   ├── requests (2.32.5)     │ ← Import from here      │
#         │   │   ├── urllib3               │                         │
#         │   │   └── ...                   │                         │
#         │   └─────────────────────────────┘                         │
#         │                                                           │
#         └───────────────────────────────────────────────────────────┘



########################################################################################
########################################################################################
########################################################################################
########################################################################################
############################ Python Build & Distribution ###############################
########################################################################################
########################################################################################
########################################################################################
########################################################################################

########################################################################################
############ Source Distribution and Binary Distribution in Python #####################
########################################################################################

# When you build a Python package, you typically create two types of distributions:

#   1. Source Distribution (sdist) - .tar.gz

#      What it is:
#         - A compressed archive of your source code as-is
#         - Contains everything needed to build the package

#      Contents:
#         - All your source files (main.py, tests/, etc.)
#         - pyproject.toml with build instructions
#         - README, LICENSE, etc.
#         - Basically your entire project directory

#      Installation process:
#         User runs: pip install uv_cats-0.1.0.tar.gz
#                ↓
#            1. Extract the archive
#            2. Read [build-system] from pyproject.toml
#            3. Install build dependencies (hatchling)
#            4. Run the build backend to create a wheel
#            5. Install the wheel

#      Pros:
#         - ✅ Works on any platform
#         - ✅ Transparent - you can see all the source code

#      Cons:
#         - ❌ Slower to install (needs to build first)
#         - ❌ Requires build tools to be available
#         - ❌ Can fail if build dependencies are missing


#   2. Binary Distribution (wheel) - .whl file

#      What it is:
#         - A pre-built package ready to install
#         - No building required

#      Breaking down the filename:
#         uv_cats-0.1.0-py3-none-any.whl
#            - uv_cats - package name
#            - 0.1.0 - package version
#            - py3 - Works with Python 3
#            - none - No specific ABI (Application Binary Interface) required
#            - any - Works on any platform (Linux, Windows, Mac)

#      Contents:
#         - Ready-to-use Python files
#         - Metadata in .dist-info/ directory
#         - Entry points already configured
#         - No build files needed

#      Installation process:
#         User runs: pip install uv_cats-0.1.0-py3-none-any.whl
#                ↓
#            1. Extract the wheel
#            2. Copy files to site-packages
#            3. Install entry points (scripts)
#            4. Done!

#      Pros:
#         - ✅ Fast installation (no build step)
#         - ✅ Reliable (pre-built, tested)
#         - ✅ No build tools required

#      Cons:
#         - ❌ Platform-specific for packages with C extensions
#         - ❌ Larger file size (sometimes)


#   Real-world analogy:

#      Source Distribution = Recipe with ingredients
#         - You get flour, eggs, sugar
#         - You need to bake the cake yourself
#         - Takes time and requires an oven (build tools)

#      Binary Distribution = Pre-made cake
#         - Already baked and ready to eat
#         - Just open and serve
#         - Fast and convenient


#   What gets uploaded to PyPI?

#      Typically both:
#         uv build       # Creates both .tar.gz and .whl
#         uv publish     # Uploads both to PyPI

#      This gives users the best of both worlds:
#         - Fast installation (wheel)
#         - Fallback option (sdist) if wheel doesn't match


#   What uv / pip prefer:

#      When you run `pip install requests` or `uv add requests`:
#         1. First choice: Look for a compatible wheel
#           - Fast installation
#           - No build required
#         2. Fallback: Download source distribution
#           - Build a wheel locally
#           - Then install the wheel



########################################################################################
############################## Python Package Index (PyPI) #############################
########################################################################################

# The Python Package Index, commonly known as PyPI, is the official third-party
# software repository for the Python programming language hosted at pypi.org.

# PyPI serves as a central hub for Python developers to share their projects and
# make them available to the community. By using PyPI, you can leverage a vast
# array of pre-built solutions to accelerate your development process, ensuring
# you don't have to "reinvent the wheel" for common tasks.

# Whether you're looking for web development frameworks, data analysis tools, or
# utilities for scientific computing, PyPI has something for every Python
# programmer.



########################################################################################
########################################################################################
########################################################################################
########################################################################################
############################## Python Concepts (Misc) ##################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################

########################################################################################
################### Framework vs. Non-Framework Build for Python #######################
########################################################################################

# On macOS, a "framework build" of Python refers to an installation where Python
# is packaged as a macOS Framework. This type of installation is common when using
# installers from python.org or the XCode Command Line Tools.

# Characteristics:
#   Often installed by official Python installers.
#   Owned by the 'root' account, meaning modifications may require sudo/admin
#   privileges.
#   Integrated with macOS's framework system.
#   Designed to allow applications to embed and use Python, especially those with
#   graphical user interfaces (GUIs).

# A "non-framework build" on macOS, often called a "source build," means Python is
# compiled and installed directly from its source code, usually into a location
# like /usr/local/bin or a user-specific directory.

# Characteristics:
#   Installed by compiling from source code.
#   Owned by the account that performed the installation, allowing easier
#   modification.
#   Provides more control over the compilation process and potential
#   customizations.
#   Intended for command-line use and general development.



########################################################################################
############################### USER_BASE and USER_SITE ################################
########################################################################################

# USER_BASE and USER_SITE are Python's standard locations for user-specific
# package installations (as opposed to system-wide installations). USER_BASE and
# USER_SITE values are set by the site module, which is imported by default when
# the Python interpreter starts.

# The 'PYTHONUSERBASE' environment variable is the primary mechanism to explicitly
# control USER_BASE. If it is not set, Python uses platform-specific default
# locations for USER_BASE (~/Library/Python/X.Y)

# python3 -m site --user-base
# Shows USER_BASE for Xcode-installed Python
# /Users/kapil/Library/Python/3.9

# python3 -m site --user-site
# Shows USER_SITE for Xcode-installed Python
# /Users/kapil/Library/Python/3.9/lib/python/site-packages

# python3.14 -m site --user-base
# Shows USER_BASE for UV-installed Python
# /Users/kapil/.local

# python3.14 -m site --user-site
# Shows USER_SITE for UV-installed Python
# /Users/kapil/.local/lib/python3.14/site-packages

# When they're used:
#   `pip install --user <package>` installs to these locations (on macos, when
#      using the Xcode-installed python, even running without --user installs to
#      the "user installation" location, with the message "Defaulting to user
#      installation because normal site-packages is not writeable")
#   Executables go in USER_BASE/bin
#   Python packages go in USER_SITE

# Why they exist:
#   Allows installing packages without sudo/admin privileges
#   Keeps user packages separate from system packages
#   Useful when you don't have write access to system directories



########################################################################################
################################### Python sys.path ####################################
########################################################################################

# A fundamental concept in Python

# sys.path is a list of directory paths that Python searches when you use import
# statements.

#   sys.path is:
#      - A list of directories python searches (first to last) when you use import
#        statements. First match wins.
#      - Can be modified at runtime
#      - Controls where Python finds modules
#      - Virtual environments work by adding their `site-packages` to sys.path
#      - UV's --with flag works by manipulating sys.path to include multiple locations



########################################################################################
################## Rust-Based Tools in Python Tooling Ecosystem ########################
########################################################################################

# Recently, a few exciting tools built with the Rust programming language have
# appeared in the Python tooling ecosystem.

# Popular examples:
#   1. Ruff — a linter and code formatter for Python
#   2. UV - an extremely fast Python package and project manager

# The main idea behind these tools is to accelerate your Python workflow by
# speeding up your project management actions. For example, Ruff is 10 to 100
# times faster than linters like Flake8 and code formatters like Black. Similarly,
# for package installation, uv is 10 to 100 times faster than pip.



########################################################################################
####################################### aiohttp ########################################
########################################################################################

# aiohttp is a popular Python library that allows you to write asynchronous HTTP
# clients and servers. Think of it like Python's requests library but turbocharged
# with the power of asynchronous programming.

# It's built on top of Python's asyncio framework, which means it can handle a
# large number of requests concurrently without waiting for each one to complete
# before moving to the next.

# aiohttp is a must-have tool in your Python toolkit if you're dealing with web
# scraping, API requests, or any other task that requires making many HTTP
# requests.



########################################################################################
########################################################################################
########################################################################################
########################################################################################
################################### Python Testing #####################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################

########################################################################################
################################### capsys (pytest) ####################################
########################################################################################

# capsys is a built-in pytest fixture that captures writes to sys.stdout and
# sys.stderr. It allows you to test functions that print to the console by
# capturing their output and making assertions about it. This is particularly
# useful for testing CLI applications, where console output is a primary feature
# to verify.

# Key points:
#   1. Automatic injection: Just add capsys as a parameter to your test function
#      - pytest automatically provides it (this is called dependency injection)
#   2. readouterr() method: Returns a named tuple with two attributes:
#      - captured.out - everything written to stdout
#      - captured.err - everything written to stderr
#   3. Each call to readouterr() returns the captured text since the last call
#      and resets the buffer.



########################################################################################
############################### pytest.raises() (pytest) ###############################
########################################################################################

# pytest.raises() is a "context manager" that verifies a specific exception is
# raised within a block of code. If the expected exception is NOT raised, the test
# fails.

# pytest.raises() makes your test explicitly state "I expect this code to fail
# with this specific exception" - which is important for testing error handling
# and validation logic.

# Why does this test use SystemExit?

# def test_parse_args_missing_breed(self):
#     """Test missing breed argument"""
#     with patch("sys.argv", ["main.py"]):  # Simulate running with no arguments
#         with pytest.raises(SystemExit):    # Expect SystemExit to be raised
#             parse_args()                   # This will fail because breed is required

# When argparse encounters invalid arguments (like missing required arguments), it:
# 	1. Prints an error message
#   2. Prints the help message
#   3. Calls sys.exit(2) which raises SystemExit


# Context managers in python are objects that define setup and cleanup behavior.

#   How pytest.raises() works as a context manager

#   with pytest.raises(SystemExit):
#       parse_args()  # Code that should raise SystemExit

#   Here's what happens step by step:

#     1. BEFORE the block: pytest sets up exception monitoring
#     2. DURING the block: pytest watches for the SystemExit exception
#     3. AFTER the block: pytest checks:
#       - ✅ If SystemExit was raised → Test PASSES
#       - ❌ If NO exception was raised → Test FAILS
#       - ❌ If DIFFERENT exception was raised → Test FAILS



########################################################################################
########################################################################################
########################################################################################
########################################################################################
################################## Article Bookmarks ###################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################

# https://realpython.com/python-uv

# https://realpython.com/async-io-python/

# https://www.linkedin.com/pulse/comparing-python-build-backends-setuptools-hatchling-flit-sharma-cq2cf/


########################################################################################
########################################################################################
########################################################################################
########################################################################################
####################################### Aliases ########################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################

alias python='python3.14'
alias s='git status'
alias d='git diff'
