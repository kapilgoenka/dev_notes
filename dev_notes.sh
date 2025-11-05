#
# This file started out as the .zshrc file on my local dev machine (mac). To understand 
# it better, I decided to elaborate how each line in the file got there and what it
# meant. Along the way, the file has evolved to be primarily my dev-notes file where I
# am documenting my learnings about Python, AI etc.
#
# File structure:
# Top-level sections have four rows of #s before & after the section title
# With the top-level sections, sub-sections have one row of #s before / after the title
#





########################################################################################
########################################################################################
########################################################################################
########################################################################################
######################################## NodeJS ########################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################

# When you install nvm using its standard installation script, it automatically appends
# these lines to your shell configuration file (.zshrc for zsh, .bashrc for bash, etc.)
# so that nvm is available every time you open a new terminal.

# These lines need to be in your .zshrc because nvm is actually a shell function, not a
# binary executable, so it must be loaded into each shell session.

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

# The following lines have been added by Docker Desktop to enable Docker CLI
# completions.

fpath=(/Users/kapil/.docker/completions $fpath)
autoload -Uz compinit
compinit





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

# UV integrates into one tool most of the functionality provided by tools like pip, pip-
# tools, pipx, poetry, pyenv, twine, virtualenv, and more.

# UV can build and publish Python packages to package repositories like PyPI, supporting
# a streamlined process from development to distribution

# UV can scaffold a full Python project, including the root directory, Git
# repository, virtual environment, pyproject.toml, README, and more.

# When it comes to managing your project's dependencies, uv makes your life easier with
# a clean workflow. This workflow allows you to lock your project's dependencies so that
# other developers can reproduce your environment exactly and contribute to your code
# without much setup effort.



########################################################################################
#################################### Homebrew vs UV ####################################
########################################################################################

# Homebrew and UV are fundamentally different tools that serve different purposes.

# Homebrew is a general-purpose package manager for macOS, while UV is a python-specific
# package and project manager. You would use Homebrew to install system-level tools,
# including UV itself, while UV is used for managing Python packages and projects, a
# task traditionally handled by pip.



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

# The file ~/.local/bin/env is a shell script created by the uv installer to manage the
# PATH environment variable.

# When uv is installed, it places its executables (like uv itself, uvx, env, and
# env.fish) into the ~/.local/bin directory by default.

# The `env` script ensures that ~/.local/bin is added to your PATH if it's not already
# present. This allows you to execute uv and its associated tools directly from your
# terminal without specifying the full path to the executable.

# Breaking it down:

# . - This is the source command (shorthand for source). It executes the script in your
# current shell session rather than in a subshell, meaning any environment variables or
# functions defined in that script will persist in your current shell.

# So essentially, when your shell starts up (since this is in .zshrc), it runs the `env`
# script, which likely sets up environment variables, PATH modifications, or other shell
# configurations. This is a common pattern for keeping your .zshrc cleaner by moving
# some configuration logic into separate files.

. "$HOME/.local/bin/env"



########################################################################################
################################# UV Shell Completion ##################################
########################################################################################

eval "$(uv generate-shell-completion zsh)"



########################################################################################
##################################### UV Project #######################################
########################################################################################

# Projects help manage Python code spanning multiple files.

# When creating projects, uv supports two basic templates:
#    1. Applications
#    2. Libraries

# By default, uv will create a project for a non-packaged application. The --lib flag
# can be used to create a project for a library instead.

# There are two types of application projects: "packaged" and "non-packaged":

#    You probably need a packaged-project if you want to:
#       - Add commands to the project
#       - Distribute the project to others
#       - Use a src and test layout
#       - Write a library

#    You probably do not need a non-packaged project if you are:
#       - Writing scripts
#       - Building a simple application
#       - Using a flat layout

# You can create a new Python project using the `uv init` command:
#    $ uv init hello-world
#    $ cd hello-world

# Initial project structure:
#    .
#    ├── .git
#    ├── .gitignore
#    ├── .python-version
#    ├── README.md
#    ├── main.py
#    └── pyproject.toml

# The --package flag can be used to create a packaged application with the
# default build system. In this case, the source code is moved into a src
# directory with a module directory and an __init__.py file:

#    $ uv init --package example-pkg
#    $ tree example-pkg
#       .
#       ├── .git
#       ├── .gitignore
#       ├── .python-version
#       ├── README.md
#       └── pyproject.toml
#       └── src
#            └── tree example_pkg
#                 └── __init__.py

#    Inside pyproject.toml:
#       [build-system]
#       requires = ["uv_build>=0.9.7,<0.10.0"]
#       build-backend = "uv_build"

# A library provides functions and objects for other projects to consume. Libraries are
# intended to be built and distributed, e.g., by uploading them to PyPI.

# Using --lib implies --package. Libraries always require a packaged project.

# $ uv init --lib example-lib

# As with a packaged application, a src layout is used. A py.typed marker is included to
# indicate to consumers that types can be read from the library:

#    $ uv init --lib example-lib
#    $ tree example-lib
#       .
#       ├── .git
#       ├── .gitignore
#       ├── .python-version
#       ├── README.md
#       └── pyproject.toml
#       └── src
#            └── tree example_lib
#                 └── py.typed
#                 └── __init__.py

#    Inside pyproject.toml:
#       [build-system]
#       requires = ["uv_build>=0.9.7,<0.10.0"]
#       build-backend = "uv_build"

# The created module defines a simple API function:

# __init__.py

# def hello() -> str:
#     return "Hello from example-lib!"
# And you can import and execute it using uv run:


# cd example-lib
# uv run python -c "import example_lib; print(example_lib.hello())"
# Hello from example-lib!


# In addition to the files created by `uv init`, uv will create a virtual
# environment and uv.lock file in the root of your project the first time you run a
# project command, i.e., uv run, uv sync, or uv lock.
#    .
#    ├── .venv
#    │   ├── bin
#    │   ├── lib
#    │   └── pyvenv.cfg
#    ├── .git
#    ├── .gitignore
#    ├── .python-version
#    ├── README.md
#    ├── main.py
#    ├── pyproject.toml
#    └── uv.lock


# ---------------
# pyproject.toml
# ---------------
# Python project metadata is defined in a pyproject.toml file.


# ---------------
# .python-version
# ---------------
# The .python-version file contains the project's default Python version. This file
# tells uv which Python version to use when creating the project's virtual
# environment.


# -----
# .venv
# -----
# The .venv folder contains your project's virtual environment, a persistent Python
# environment that is isolated from the rest of your system. This is where uv will
# install your project's dependencies. Automatically excluded from git with an internal
# .gitignore file

# Prior to every `uv run` invocation, uv will verify that the lockfile is up-to-date
# with the pyproject.toml, and that the environment is up-to-date with the lockfile,
# keeping your project in-sync without the need for manual intervention. uv run
# guarantees that your command is run in a consistent, locked environment.


# ----------------------
# Optional dependencies
# ----------------------

# It is common for projects that are published as libraries to make some features
# optional to reduce the default dependency tree. For example, Pandas has an "excel"
# extra and a "plot" extra to avoid installation of Excel parsers and matplotlib unless
# someone explicitly requires them.

# Optional dependencies are specified in [project.optional-dependencies], a TOML table
# that maps from extra name to its dependencies, following dependency specifiers syntax.

# pyproject.toml

#    [project]
#    name = "pandas"
#    version = "1.0.0"

#    [project.optional-dependencies]
#    plot = [


#      "matplotlib>-3.6.3"
#    ]
#    excel - [
#      "odfpy>=1.4.1",
#      "openpyxl>=3.1.0",
#      "python-calamine>=0.1.7",
#      "pyxlsb>=1.0.10",
#      "xlrd>=2.0.1",
#      "xlsxwriter>=3.0.5"
#    ]

# To add an optional dependency, use the --optional <extra> option:
#    uv add httpx --optional network



########################################################################################
################################ Build systems #########################################
########################################################################################

# A build system determines how the project should be packaged and installed. Projects
# may declare and configure a build system in the [build-system] table of the
# pyproject.toml.

# uv uses the presence of a build system to determine if a project contains a
# package that should be installed in the project virtual environment. If a build system
# is not defined, uv will not attempt to build or install the project itself, just its
# dependencies. If a build system is defined, uv will build and install the project into
# the project environment.

# When using `uv build`, uv acts as a build frontend and only determines the Python
# version to use and invokes the build backend. The details of the builds, such as the
# included files and the distribution filenames, are determined by the build backend, as
# defined in [build-system]. Information about build configuration can be found in the
# respective tool's documentation.



########################################################################################
################ Managed and system Python installations in UV #########################
########################################################################################

# uv refers to Python versions it installs as managed Python installations and all
# other Python installations as system Python installations.

# uv does not distinguish between Python versions installed by the operating system
# vs those installed and managed by other tools. For example, if a Python installation
# is managed with pyenv, it would still be considered a system Python version in uv.

# The available Python versions are frozen for each uv release. To install new Python
# versions, you may need upgrade uv.



########################################################################################
################################ UV Lock File (uv.lock) ################################
########################################################################################

# A cross-platform lockfile that contains information about your project's dependencies.
# This file ensures that other developers can quickly and exactly reproduce your working
# environment.

# Unlike the pyproject.toml, which is used to specify the broad requirements of your
# project, the lockfile contains the exact resolved versions that are installed in the
# project environment. This file should be checked into version control, allowing for
# consistent and reproducible installations across machines.

# Additionally, it ensures when deploying the project as an application that the exact
# set of used package versions is known.

# The lockfile is automatically created and updated during uv invocations that use the
# project environment, i.e., uv sync and uv run. The lockfile may also be explicitly
# updated using uv lock.

# uv.lock is a human-readable TOML file but is managed by uv and should not be edited
# manually. The uv.lock format is specific to uv and not usable by other tools.

# As a counterpart, syncing is the process of installing the required packages from the
# lockfile into the project's development environment.

# Both locking and syncing processes are automatically handled by uv. For example, when
# you execute uv run, the project is locked and synced before the command is invoked.

# To see this in action, you can go ahead and remove the .venv/ folder from the
# project's root directory. `uv run` will recreate it.



########################################################################################
###################################### UV Tools ########################################
########################################################################################


# ---------------------
# The uv tool interface
# ---------------------

# uv includes a dedicated interface for interacting with tools. Tools can be invoked
# without installation using uv tool run, in which case their dependencies are installed
# in a temporary virtual environment isolated from the current project.

# Because it is very common to run tools without installing them, a uvx alias is
# provided for uv tool run — the two commands are exactly equivalent. For brevity, the
# documentation will mostly refer to uvx instead of uv tool run.

# Tools can also be installed with uv tool install, in which case their executables
# are available on the PATH — an isolated virtual environment is still used, but it
# is not removed when the command completes.


# ---------------------
# The bin directory
# ---------------------

# Tool executables are symlinked into the user bin directory - ~/.local/bin

# The bin directory must be in the PATH variable for tool executables to be available
# from the shell. If it is not in the PATH, a warning will be displayed. The uv tool
# update-shell command can be used to add the bin directory to the PATH in common shell
# configuration files.


# -----------------------
# Overwriting executables
# -----------------------

# Installation of tools will not overwrite executables in the bin directory that were
# not previously installed by uv. For example, if pipx has been used to install a tool,
# uv tool install will fail. The --force flag can be used to override this behavior.


# -----------------------------
# Executing vs installing tools
# -----------------------------

# In most cases, executing a tool with uvx is more appropriate than installing the tool.
# Installing the tool is useful if you need the tool to be available to other programs
# on your system, e.g., if some script you do not control requires the tool, or if you
# are in a Docker image and want to make the tool available to users.


# ------------------
# Tool environments
# ------------------

# When running a tool with uvx, a virtual environment is stored in the uv cache
# directory and is treated as disposable, i.e., if you run uv cache clean the
# environment will be deleted. The environment is only cached to reduce the overhead of
# repeated invocations. If the environment is removed, a new one will be created
# automatically.

# When installing a tool with uv tool install, a virtual environment is created in the
# uv tools directory. The environment will not be removed unless the tool is
# uninstalled. If the environment is manually deleted, the tool will fail to run.



########################################################################################
################################# UV Python Versions ###################################
########################################################################################

# Upgrading Python versions

# uv allows transparently upgrading Python versions to the latest patch release,
# e.g., 3.13.4 to 3.13.5

# uv does not allow transparently upgrading across minor Python versions, e.g.,
# 3.12 to 3.13, because changing minor versions can affect dependency resolution.

# uv-managed Python versions can be upgraded to the latest supported patch
# release with the python upgrade command



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
# │ uv run --isolated        │ Run a command in an isolated environment          │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv tree                  │ View the dependency tree for the project          │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv build                 │ Build project into distribution archives          │
# ├──────────────────────────┼───────────────────────────────────────────────────┤
# │ uv publish               │ Publish project to a package index                │
# └──────────────────────────┴───────────────────────────────────────────────────┘
# │ uv format                │ Format Python code in the project                 │
# └──────────────────────────┴───────────────────────────────────────────────────┘




# Tools Running and installing tools published to Python package indexes, e.g., ruff or
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


# Utility Managing and inspecting uv's state, such as the cache, storage directories, or
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

# The [project.scripts] section in the TOML file defines command-line entry points that
# get installed when someone installs your package.

# Example:
# 	[project.scripts]
# 	uv-cats = "main:main"

# This tells the build backend (e.g. Hatchling): "Create a command-line script called
# uv-cats". The script essentially does this:

#   #!/usr/bin/env python
#   # Auto-generated entry point script
# 
#   from main import main
# 
#   if __name__ == '__main__':
# 	  sys.exit(main())

# Without the [project.scripts] section, users would need to know your internal module
# structure in order to run the main.py script. With it, they can just run `uv-cats`
# command, and it works!

# What happens when you install the package?

# Assume package name is 'uv-cats'.
# When someone runs `pip install uv-cats` or `uv tool install uv-cats`, Python puts the
# executable script in their PATH (like /usr/local/bin/uv-cats or similar)



########################################################################################
################# UV pyproject.toml file: [build-system] section #######################
########################################################################################

# The [build-system] section tells Python packaging tools how to build your package -
# specifically, which build tool to use and what dependencies it needs.


# ------------------------
#   Example configuration:
# ------------------------

#   [build-system]
#   requires = ["hatchling"]
#   build-backend = "hatchling.build"

#   This says:
#   1. "To build this package, you need Hatchling installed"
#   2. "Use Hatchling as the build tool"


# --------------------------
#   What are build backends?
# --------------------------

#   Build backends are tools that know how to:
#   - Read your pyproject.toml
#   - Find your Python files
#   - Create wheel files (.whl)
#   - Create source distributions (.tar.gz)
#   - Install entry points (like our uv-cats command)


# -------------------------
#   Common build backends:
# -------------------------

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


# -----------------------
#   Why do we need this?
# -----------------------

#   [tool.hatch.build.targets.wheel]
#   packages = ["."]

# By default, Hatchling expects your code to be in a directory that matches your package
# name. For example:

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

# Downloaded packages are stored in UV's package cache (persistent) and reused:
# ~/.cache/uv/archive-v0/



########################################################################################
######################### UV Temporary Environments Location ###########################
########################################################################################

#   Temporary environments are created in:
#      ~/.cache/uv/builds-v0/



########################################################################################
##################### Sample UV Temporary Environment Structure ########################
########################################################################################

# A temporary environment is a full Python virtual environment containing:
# ~/.cache/uv/builds-v0/ .tmpX44ntz/
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

# `uv run --with` ALMOST ALWAYS creates a temporary environment, even when run inside a
# UV project! The only expection is when the packages requested in the --with flag are
# already in the project dependencies (along with compatible version for each).

#   If a temporary environment is used, it's python interpreter's sys.path is configured
#   to include:
#      - Temporary environment location (for the Python interpreter)
#      - Package cache (for --with packages)
#      - Project's .venv/ (for project dependencies)

# UV uses symlinks from it's package cache to temp environments, so it's extremely fast
# and doesn't duplicate files. This design makes `uv run --with` perfect for one-off
# scripts and automation - you get the benefits of isolation without the overhead of
# managing virtual environments!

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
################################### Running scripts ####################################
########################################################################################

# A Python script is a file intended for standalone execution, e.g., with
# python <script>.py.

# Using uv to execute scripts ensures that script dependencies are managed
# without manually managing environments.

# If your script has no dependencies, you can execute it with uv run
# $ uv run example.py

# Similarly, if your script depends on a module in the standard library,
# there's nothing more to do:
# $ uv run example.py

# Your script can be read directly from stdin:
# $ echo 'print("hello world!")' | uv run -

# If your shell supports here-documents:
# uv run - <<EOF
# print("hello world!")
# EOF


# ------------------------
# Creating a Python script
# ------------------------

# Python recently added a standard format for inline script metadata. 
# It allows for selecting Python versions and defining dependencies.

# Use uv init --script to initialize scripts with the inline metadata:
#    $ uv init --script example.py --python 3.12

# uv supports adding and updating inline script metadata for you.

# Use uv add --script to declare the dependencies for the script:
#    $ uv add --script example.py 'requests<3' 'rich'

# This will add a script section at the top of the script declaring the dependencies
# using TOML: # /// script # dependencies = [ #   "requests<3", #   "rich", # ] # ///

#          import requests
#          from rich.pretty import pprint

#          resp = requests.get("https://peps.python.org/api/peps.json")
#          data = resp.json()
#          pprint([(k, v["title"]) for k, v in data.items()][:10])


# -----------------------------------------
# Running scripts with iniline dependencies
# -----------------------------------------

# Scripts that declare inline metadata are automatically executed in
# environments isolated from the project.

# For example, given a script:

#    example.py

#    # /// script
#    # dependencies = [
#    #   "httpx",
#    # ]
#    # ///

#    import httpx

#    resp = httpx.get("https://peps.python.org/api/peps.json")
#    data = resp.json()
#    print([(k, v["title"]) for k, v in data.items()][:10])

# The invocation `uv run example.py` would run isolated from the project with only the
# given dependencies listed.


# ------------
# Entry points
# ------------

# Entry points are the official term for an installed package to advertise
# interfaces. These include:

# Command line interfaces
# Graphical user interfaces
# Plugin entry points

# Projects may define command line interfaces (CLIs) for the project in the
# [project.scripts] table of the pyproject.toml. Projects may define graphical user
# interfaces (GUIs) for the project in the [project.gui-scripts] table of the
# pyproject.toml. Projects may define entry points for plugin discovery in the
# [project.entry-points] table of the pyproject.toml.





########################################################################################
########################################################################################
########################################################################################
########################################################################################
################################## Python (Misc) #######################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################



########################################################################################
################################ macOS System Python ###################################
########################################################################################

# macOS System Python refers to the python installed by Xcode Command Line Tools.

# This python instllation is a 'framework' build.

# This can be verified by running the command below. If it returns an empty string or
# None, it's not a framework build. If it returns a value (like 'Python' or 'Python3'),
# it's a framework build. python3 -c "import sysconfig;
# print(sysconfig.get_config_var('PYTHONFRAMEWORK'))" Python3

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

# These shims load libxcselect.dylib to dynamically locate and execute the real versions
# of these tools within the active Xcode or Command Line Tools installation. This allows
# for flexibility in managing multiple Xcode versions and ensures that the correct tools
# are always used. If XCode Command Line Tools are not installed, running the shims
# triggers a popup for install.

# Installing XCode Command Line Tools makes shims like `python3` & `pip3` functional.
# However, upgraging pip using `python3 -m ensurepip --upgrade` installs the upgraded
# version in the location site.USER_BASE, which defaults to ~/Library/Python/X.Y for
# MacOS. Similarly, any packages installed using pip (e.g. `pip3 install streamlit`) are
# also installed in the site.USER_BASE location.

# Upon upgrading pip or installing a package, if pip finds that USER_BASE/bin is not in
# $PATH, it asks you add it to $PATH.

# Sequence of steps that led to this export line: 1. Xcode Command Line Tools provided
# Python 3.9 2. You ran `python3 -m ensurepip --upgrade` using that python. This command
# installed pip to your user directory. 4. You added the export line to your .zshrc as
# per output of above command.

export PATH="$HOME/Library/Python/3.9/bin:$PATH"



########################################################################################
################### Framework vs. Non-Framework Build for Python #######################
########################################################################################

# On macOS, a "framework build" of Python refers to an installation where Python is
# packaged as a macOS Framework. This type of installation is common when using
# installers from python.org or the XCode Command Line Tools.

# Characteristics: Often installed by official Python installers. Owned by the 'root'
# account, meaning modifications may require sudo/admin privileges. Integrated with
# macOS's framework system. Designed to allow applications to embed and use Python,
# especially those with graphical user interfaces (GUIs).

# A "non-framework build" on macOS, often called a "source build," means Python is
# compiled and installed directly from its source code, usually into a location like
# /usr/local/bin or a user-specific directory.

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

# USER_BASE and USER_SITE are Python's standard locations for user-specific package
# installations (as opposed to system-wide installations). USER_BASE and USER_SITE
# values are set by the site module, which is imported by default when the Python
# interpreter starts.

# The 'PYTHONUSERBASE' environment variable is the primary mechanism to explicitly
# control USER_BASE. If it is not set, Python uses platform-specific default locations
# for USER_BASE (~/Library/Python/X.Y)

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

# When they're used: `pip install --user <package>` installs to these locations (on
# macos, when using the Xcode-installed python, even running without --user installs to
# the "user installation" location, with the message "Defaulting to user installation
# because normal site-packages is not writeable") Executables go in USER_BASE/bin Python
# packages go in USER_SITE

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

# sys.path is: - A list of directories python searches (first to last) when you use
# import statements. First match wins. - Can be modified at runtime - Controls where
# Python finds modules - Virtual environments work by adding their `site-packages` to
# sys.path - UV's --with flag works by manipulating sys.path to include multiple
# locations



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

# Breaking down the filename: uv_cats-0.1.0-py3-none-any.whl - uv_cats - package name -
# 0.1.0 - package version - py3 - Works with Python 3 - none - No specific ABI
# (Application Binary Interface) required - any - Works on any platform (Linux, Windows,
# Mac)

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

# The Python Package Index, commonly known as PyPI, is the official third-party software
# repository for the Python programming language hosted at pypi.org.

# PyPI serves as a central hub for Python developers to share their projects and make
# them available to the community. By using PyPI, you can leverage a vast array of pre-
# built solutions to accelerate your development process, ensuring you don't have to
# "reinvent the wheel" for common tasks.

# Whether you're looking for web development frameworks, data analysis tools, or
# utilities for scientific computing, PyPI has something for every Python programmer.



########################################################################################
################## Rust-Based Tools in Python Tooling Ecosystem ########################
########################################################################################

# Recently, a few exciting tools built with the Rust programming language have appeared
# in the Python tooling ecosystem.

# Popular examples:
#   1. Ruff — a linter and code formatter for Python
#   2. UV - an extremely fast Python package and project manager

# The main idea behind these tools is to accelerate your Python workflow by speeding up
# your project management actions. For example, Ruff is 10 to 100 times faster than
# linters like Flake8 and code formatters like Black. Similarly, for package
# installation, uv is 10 to 100 times faster than pip.



########################################################################################
####################################### aiohttp ########################################
########################################################################################

# aiohttp is a popular Python library that allows you to write asynchronous HTTP clients
# and servers. Think of it like Python's requests library but turbocharged with the
# power of asynchronous programming.

# It's built on top of Python's asyncio framework, which means it can handle a large
# number of requests concurrently without waiting for each one to complete before moving
# to the next.

# aiohttp is a must-have tool in your Python toolkit if you're dealing with web
# scraping, API requests, or any other task that requires making many HTTP requests.





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

# capsys is a built-in pytest fixture that captures writes to sys.stdout and sys.stderr.
# It allows you to test functions that print to the console by capturing their output
# and making assertions about it. This is particularly useful for testing CLI
# applications, where console output is a primary feature to verify.

# Key points: 1. Automatic injection: Just add capsys as a parameter to your test
# function - pytest automatically provides it (this is called dependency injection) 2.
# readouterr() method: Returns a named tuple with two attributes: - captured.out -
# everything written to stdout - captured.err - everything written to stderr 3. Each
# call to readouterr() returns the captured text since the last call and resets the
# buffer.



########################################################################################
############################### pytest.raises() (pytest) ###############################
########################################################################################

# pytest.raises() is a "context manager" that verifies a specific exception is raised
# within a block of code. If the expected exception is NOT raised, the test fails.

# pytest.raises() makes your test explicitly state "I expect this code to fail with this
# specific exception" - which is important for testing error handling and validation
# logic.

# Why does this test use SystemExit?

# def test_parse_args_missing_breed(self): """Test missing breed argument""" with
# patch("sys.argv", ["main.py"]):  # Simulate running with no arguments with
# pytest.raises(SystemExit):    # Expect SystemExit to be raised parse_args() # This
# will fail because breed is required

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
###################################### NotebookLM ######################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################

# What is NotebookLM?

# An AI-powered tool from Google that acts as a research and writing assistant.

# Helps users analyze and interact with their own documents.

# Users can upload various files or link to sources, and then ask questions or request
# summaries that are grounded in that specific content.

# Upload PDFs, websites, YouTube videos, audio files, Google Docs, Google Slides and
# more, and NotebookLM will summarize them and make interesting connections between
# topics, all powered by the latest version of Gemini's multimodal understanding
# capabilities.

# Upload lecture recordings, textbook chapters, and research papers. Ask NotebookLM to
# explain complex concepts in simple terms, provide real-world examples, and reinforce
# your understanding.

# Upload your source material and let NotebookLM create a polished presentation outline,
# complete with key talking points and supporting evidence.

# NotebookLM is effectively an end-user customizable RAG product. It lets you gather
# together multiple "sources" - documents, pasted text, links to web pages and YouTube
# videos - into a single interface where you can then use chat to ask questions of them.
# Under the hood it's powered by their long-context Gemini 1.5 Pro LLM.





########################################################################################
########################################################################################
########################################################################################
########################################################################################
##################################### macOS Dev ########################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################



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

# brew install cirruslabs/cli/tart tart clone ghcr.io/cirruslabs/macos-tahoe-
# vanilla:latest my-tahoe-vanilla-vm tart run my-tahoe-vanilla-vm





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





########################################################################################
########################################################################################
########################################################################################
########################################################################################
####################################### Django #########################################
########################################################################################
########################################################################################
########################################################################################
########################################################################################



########################################################################################
#################################### Django project ####################################
########################################################################################

# A Django project is the overall container for your application's settings and
# configurations (e.g., database settings, installed apps, URL routing at the project
# level). Django projects are composed of one or more "apps".



########################################################################################
###################################### Django App ######################################
########################################################################################

# An app is a self-contained module that handles a specific piece of
# functionality (like a blog, a user management system, etc.)



########################################################################################
############################# Django’s MVT Architecture ################################
########################################################################################

# Django’s MVT (Model-View-Template) is a twist on the MVC pattern. 

#    The “View” part deals with user requests.

#    The “Model” part manages data and talks to the database.

#    And the “Template” part shows the data to users.



########################################################################################
################################### Django ORM ########################################
########################################################################################

# The Django ORM (Object-Relational Mapping) lets developers work with databases in
# Python. This means no need for raw SQL queries. It makes managing databases easy and
# helps apps grow.

# Using Django’s ORM correctly is key to handling complex queries & avoiding slowdowns.



########################################################################################
################################### django-admin #######################################
########################################################################################

# django-admin is Django’s command-line utility for administrative tasks.



########################################################################################
#################################### manage.py #########################################
########################################################################################

# manage.py is automatically created in each Django project.

# It does the same thing as django-admin but also sets the DJANGO_SETTINGS_MODULE
# environment variable so that it points to your project’s settings.py file.

# Generally, when working on a single Django project, it's easier to use
# manage.py than django-admin.



########################################################################################
#################################### Migrations ########################################
########################################################################################

# Migrations are Django's way of propagating changes you make to your models into your
# database schema.


# ------------------
# Migration Commands
# ------------------
#
# ┌──────────────────┬───────────────────────────────────────────────────────────────┐
# │ Command          │ Description                                                   │
# ├──────────────────┼───────────────────────────────────────────────────────────────┤
# │ migrate          │ Responsible for applying and unapplying migrations.           │
# ├──────────────────┼───────────────────────────────────────────────────────────────┤
# │ makemigrations   │ Responsible for creating new migrations based on the changes  │
# │                  │ you have made to your models.                                 │
# ├──────────────────┼───────────────────────────────────────────────────────────────┤
# │ sqlmigrate       │ Displays the SQL statements for a migration.                  │
# ├──────────────────┼───────────────────────────────────────────────────────────────┤
# │ showmigrations   │ Lists a project's migrations and their status.                │
# └──────────────────┴───────────────────────────────────────────────────────────────┘

# You can think of migrations as a version control system for your database schema.
# `makemigrations` is responsible for packaging up your model changes into individual
# migration files - analogous to commits - and `migrate` is responsible for applying
# those to your database.

# The migration files for each app live in a "migrations" directory inside of that app,
# and are designed to be committed to, and distributed as part of, its codebase. You
# should be making them once on your development machine and then running the same
# migrations on your colleagues' machines, your staging machines, and eventually your
# production machines.


# ---------------
# Backend Support
# ---------------
#
# ┌────────────────┬─────────────────────────────────────────────────────────────────┐
# │ DB Name        │ Support                                                         │
# ├────────────────┼─────────────────────────────────────────────────────────────────┤
# │ PostgreSQL     │ Is the most capable in terms of schema support.                 │
# ├────────────────┼─────────────────────────────────────────────────────────────────┤
# │ MySQL          │ Lacks support for transactions around schema alteration         │
# │                │ operations, meaning that if a migration fails to apply you will │
# │                │ have to manually unpick the changes in order to try again (it's │
# │                │ impossible to roll back to an earlier point). MySQL also has a  │
# │                │ relatively small limit on the combined size of all columns an   │
# │                │ index covers. This means that indexes that are possible on      │
# │                │ other backends will fail to be created under MySQL.             │
# ├────────────────┼─────────────────────────────────────────────────────────────────┤
# │ SQLite         │ Has very little built-in schema alteration support. Django      │
# │                │ attempts to emulate it. It is not recommended that you run and  │
# │                │ migrate SQLite in a production environment.                     │
# └────────────────┴─────────────────────────────────────────────────────────────────┘


# ------------------
# Migration Workflow
# ------------------
#
# ┌──────┬─────────────────────────────────┬──────────────────────────────────────────┐
# │ Step │ Command                         │ Description                              │
# ├──────┼─────────────────────────────────┼──────────────────────────────────────────┤
# │ 1    │ uv run manage.py makemigrations │ Create migrations. Your models will be   │
# │      │                                 │ scanned and compared to the versions     │
# │      │                                 │ currently contained in your migration    │
# │      │                                 │ files, and then a new set of migrations  │
# │      │                                 │ will be written out.                     │
# ├──────┼─────────────────────────────────┼──────────────────────────────────────────┤
# │ 2    │ python manage.py migrate        │ Apply migrations to your database.       │
# ├──────┼─────────────────────────────────┼──────────────────────────────────────────┤
# │ 3    │ commit                          │ Once the migration is applied, commit    │
# │      │                                 │ the migration and the models change to   │
# │      │                                 │ your version control system as a single  │
# │      │                                 │ commit - that way, when other developers │
# │      │                                 │ (or your production servers) check out   │
# │      │                                 │ the code, they'll get both the changes   │
# │      │                                 │ to your models and the accompanying      │
# │      │                                 │ migration at the same time.              │
# └──────┴─────────────────────────────────┴──────────────────────────────────────────┘


# ---------------
# Version control
# ---------------

# Because migrations are stored in version control, you'll occasionally come across
# situations where you and another developer have both committed a migration to the same
# app at the same time, resulting in two migrations with the same number.

# Don't worry - the numbers are just there for developers' reference, Django just cares
# that each migration has a different name. Migrations specify which other migrations
# they depend on - including earlier migrations in the same app - in the file, so it's
# possible to detect when there's two new migrations for the same app that aren't
# ordered.

# When this happens, Django will prompt you and give you some options. If it thinks it's
# safe enough, it will offer to automatically linearize the two migrations for you.


# ---------------
# Migration files
# ---------------

# Migrations are stored as an on-disk format, referred to here as "migration files".
# These files are actually normal Python files with an agreed-upon object layout,
# written in a declarative style.

# A basic migration file looks like this:

# from django.db import migrations, models
# class Migration(migrations.Migration):
#     dependencies = [("migrations", "0001_initial")]


# operations - [ migrations.DeleteModel("Tribble"), migrations.AddField("Author",
# "rating", models.IntegerField(default-0)), ]

# What Django looks for when it loads a migration file (as a Python module) is a
# subclass of django.db.migrations.Migration called Migration. It then inspects this
# object for four attributes, only two of which are used most of the time: dependencies:
# a list of migrations this one depends on. operations: a list of Operation classes that
# define what this migration does.

# The operations are the key; they are a set of declarative instructions which tell
# Django what schema changes need to be made. Django scans them and builds an in-memory
# representation of all of the schema changes to all apps, and uses this to generate the
# SQL which makes the schema changes.

# That in-memory structure is also used to work out what the differences are between
# your models and the current state of your migrations; Django runs through all the
# changes, in order, on an in-memory set of models to come up with the state of your
# models last time you ran makemigrations. It then uses these models to compare against
# the ones in your models.py files to work out what you have changed.


# ------------------
# Initial migrations
# ------------------

# The "initial migrations" for an app are the migrations that create the first version
# of that app's tables.

# When the migrate --fake-initial option is used, these initial migrations are treated
# specially. For an initial migration that creates one or more tables (CreateModel
# operation), Django checks that all of those tables already exist in the database and
# fake-applies the migration if so. Similarly, for an initial migration that adds one or
# more fields (AddField operation), Django checks that all of the respective columns
# already exist in the database and fake-applies the migration if so.


# ----------------
# Data migrations
# ----------------

# As well as changing the database schema, you can also use migrations to change the
# data in the database itself, in conjunction with the schema if you want.

# Migrations that alter data are usually called "data migrations"; they're best written
# as separate migrations, sitting alongside your schema migrations.

# Django can't automatically generate data migrations for you, as it does with schema
# migrations, but it's not very hard to write them. Migration files in Django are made
# up of Operations, and the main operation you use for data migrations is RunPython.

# To start, make an empty migration file you can work from (Django will put the file in
# the right place, suggest a name, and add dependencies for you):

# $ python manage.py makemigrations --empty yourappname

# Then, open up the file; it should look something like this:

# # Generated by Django A.B on YYYY-MM-DD HH:MM
# from django.db import migrations
# class Migration(migrations.Migration):
#     dependencies = [
#         ("yourappname", "0001_initial"),
#     ]

#     operations = []

# Now, all you need to do is create a new function and have RunPython use it. RunPython
# expects a callable as its argument which takes two arguments - the first is an app
# registry that has the historical versions of all your models loaded into it to match
# where in your history the migration sits, and the second is a SchemaEditor, which you
# can use to manually effect database schema changes (but beware, doing this can confuse
# the migration autodetector!)

# Let's write a migration that populates our new name field with the combined values of
# first_name and last_name. All we need to do is use the historical model and iterate
# over the rows:

# from django.db import migrations def combine_names(apps, schema_editor): # We can't
# import the Person model directly as it may be a newer # version than this migration
# expects. We use the historical version. Person = apps.get_model("yourappname",
# "Person") for person in Person.objects.all(): person.name = f"{person.first_name}
# {person.last_name}" person.save() class Migration(migrations.Migration): dependencies
# = [ ("yourappname", "0001_initial"), ] operations = [
# migrations.RunPython(combine_names), ]

# Once that's done, we can run python manage.py migrate as normal and the data migration
# will run in place alongside other migrations.

# You can pass a second callable to RunPython to run whatever logic you want executed
# when migrating backwards. If this callable is omitted, migrating backwards will raise
# an exception.


# ---------------------
# Squashing migrations
# ---------------------

# You are encouraged to make migrations freely and not worry about how many you have;
# the migration code is optimized to deal with hundreds at a time without much slowdown.
# However, eventually you will want to move back from having several hundred migrations
# to just a few, and that's where squashing comes in.

# Squashing is the act of reducing an existing set of many migrations down to one (or
# sometimes a few) migrations which still represent the same changes.

# Django does this by taking all of your existing migrations, extracting their
# Operations and putting them all in sequence, and then running an optimizer over them
# to try and reduce the length of the list - for example, it knows that CreateModel and
# DeleteModel cancel each other out, and it knows that AddField can be rolled into
# CreateModel.

# Once the operation sequence has been reduced as much as possible - the amount possible
# depends on how closely intertwined your models are and if you have any RunSQL or
# RunPython operations (which can't be optimized through unless they are marked as
# elidable) - Django will then write it back out into a new set of migration files.

# These files are marked to say they replace the previously-squashed migrations, so they
# can coexist with the old migration files, and Django will intelligently switch between
# them depending where you are in the history. If you're still part-way through the set
# of migrations that you squashed, it will keep using them until it hits the end and
# then switch to the squashed history, while new installs will use the new squashed
# migration and skip all the old ones.

# This enables you to squash and not mess up systems currently in production that aren't
# fully up-to-date yet. The recommended process is to squash, keeping the old files,
# commit and release, wait until all systems are upgraded with the new release (or if
# you're a third-party project, ensure your users upgrade releases in order without
# skipping any), and then remove the old files, commit and do a second release.

# The command that backs all this is squashmigrations - pass it the app label and
# migration name you want to squash up to, and it'll get to work:

# $ ./manage.py squashmigrations myapp 0004
# Will squash the following migrations: - 0001_initial - 0002_some_change -
# 0003_another_change - 0004_undo_something Do you wish to proceed? [y/N] y
# Optimizing... Optimized from 12 operations to 7 operations. Created new squashed
# migration
# /home/andrew/Programs/DjangoTest/test/migrations/0001_squashed_0004_undo_something.py
# You should commit this migration but leave the old ones in place; the new migration
# will be used for new installs. Once you are sure all instances of the codebase have
# applied the migrations you squashed, you can delete them. Use the squashmigrations
# --squashed-name option if you want to set the name of the squashed migration rather
# than use an autogenerated one.

# Note that model interdependencies in Django can get very complex, and squashing may
# result in migrations that do not run; either mis-optimized (in which case you can try
# again with --no-optimize, though you should also report an issue), or with a
# CircularDependencyError, in which case you can manually resolve it.

# To manually resolve a CircularDependencyError, break out one of the ForeignKeys in the
# circular dependency loop into a separate migration, and move the dependency on the
# other app with it. If you're unsure, see how makemigrations deals with the problem
# when asked to create brand new migrations from your models. In a future release of
# Django, squashmigrations will be updated to attempt to resolve these errors itself.

# Once you've squashed your migration, you should then commit it alongside the
# migrations it replaces and distribute this change to all running instances of your
# application, making sure that they run migrate to store the change in their database.

# You must then transition the squashed migration to a normal migration by:

# Deleting all the migration files it replaces.

# Updating all migrations that depend on the deleted migrations to depend on the
# squashed migration instead.

# Removing the replaces attribute in the Migration class of the squashed
# migration (this is how Django tells that it is a squashed migration).

# Note

# Once you've squashed a migration, you should not then re-squash that squashed
# migration until you have fully transitioned it to a normal migration.

# Pruning references to deleted migrations

# If it is likely that you may reuse the name of a deleted migration in the future, you
# should remove references to it from Django's migrations table with the migrate --prune
# option.



########################################################################################
################################# Django Commands ######################################
########################################################################################

# ┌────────────────────────────────────────┬─────────────────────────────────────────┐
# │ Command                                │ Description                             │
# ├────────────────────────────────────────┼─────────────────────────────────────────┤
# │ uv run manage.py help                  │ Display list of the commands provided   │
# │                                        │ by each application                     │
# ├────────────────────────────────────────┼─────────────────────────────────────────┤
# │ uv run manage.py help <command>        │ Display a description of the given      │
# │                                        │ command and a list of its available     │
# │                                        │ options                                 │
# ├────────────────────────────────────────┼─────────────────────────────────────────┤
# │ uv run manage.py startproject name     │ Creates a Django project directory      │
# │ [directory]                            │ structure for the given project name in │
# │                                        │ the current directory or the given      │
# │                                        │ destination. By default, the new        │
# │                                        │ directory contains manage.py and a      │
# │                                        │ project package (containing a           │
# │                                        │ settings.py and other files). If only   │
# │                                        │ the project name is given, both the     │
# │                                        │ project directory and project package   │
# │                                        │ will be named <projectname> and the     │
# │                                        │ project directory will be created in    │
# │                                        │ the current working directory. If the   │
# │                                        │ optional destination is provided,       │
# │                                        │ Django will use that existing directory │
# │                                        │ as the project directory, and create    │
# │                                        │ manage.py and the project package       │
# │                                        │ within it.                              │
# ├────────────────────────────────────────┼─────────────────────────────────────────┤
# │ uv run manage.py test                  │ Runs tests for all installed apps.      │
# ├────────────────────────────────────────┼─────────────────────────────────────────┤
# │ uv run manage.py runserver             │ Starts a lightweight development web    │
# │                                        │ server on the local machine. By         │
# │                                        │ default, the server runs on port 8000   │
# │                                        │ on the IP address 127.0.0.1. You can    │
# │                                        │ pass in an IP address and port number   │
# │                                        │ explicitly.                             │
# │                                        │                                         │
# │                                        │ The development server automatically    │
# │                                        │ reloads Python code for each request,   │
# │                                        │ as needed. You don't need to restart    │
# │                                        │ the server for code changes to take     │
# │                                        │ effect. However, some actions like      │
# │                                        │ adding files don't trigger a restart,   │
# │                                        │ so you'll have to restart the server in │
# │                                        │ these cases.                            │
# │                                        │                                         │
# │                                        │ If you're using Linux or MacOS and      │
# │                                        │ install both pywatchman and the         │
# │                                        │ Watchman service, kernel signals will   │
# │                                        │ be used to autoreload the server        │
# │                                        │ (rather than polling file modification  │
# │                                        │ timestamps each second). This offers    │
# │                                        │ better performance on large projects,   │
# │                                        │ reduced response time after code        │
# │                                        │ changes, more robust change detection,  │
# │                                        │ and a reduction in power usage. Django  │
# │                                        │ supports pywatchman 1.2.0 and higher.   │
# │                                        │                                         │
# │                                        │ When using Watchman with a project that │
# │                                        │ includes large non-Python directories   │
# │                                        │ like node_modules, it's advisable to    │
# │                                        │ ignore this directory for optimal       │
# │                                        │ performance.                            │
# │                                        │                                         │
# │                                        │ When you start the server, and each     │
# │                                        │ time you change Python code while the   │
# │                                        │ server is running, the system "check"   │
# │                                        │ framework will check your entire Django │
# │                                        │ project for some common errors. If any  │
# │                                        │ errors are found, they will be printed  │
# │                                        │ to standard output.                     │
# │                                        │                                         │
# │                                        │ Note that the default IP address,       │
# │                                        │ 127.0.0.1, is not accessible from other │
# │                                        │ machines on your network. To make your  │
# │                                        │ development server viewable to other    │
# │                                        │ machines on the network, use its own IP │
# │                                        │ address (e.g. 192.168.2.1), 0 (shortcut │
# │                                        │ for 0.0.0.0), 0.0.0.0, or :: (with IPv6 │
# │                                        │ enabled). You can provide an IPv6       │
# │                                        │ address surrounded by brackets (e.g.    │
# │                                        │ [200a::1]:8000). This will              │
# │                                        │ automatically enable IPv6 support.      │
# │                                        │                                         │
# │                                        │ Logging of each request and response of │
# │                                        │ the server is sent to the               │
# │                                        │ django.server logger.                   │
# │                                        │                                         │
# │                                        │ If the staticfiles contrib app is       │
# │                                        │ enabled (default in new projects) the   │
# │                                        │ runserver command will be overridden    │
# │                                        │ with its own runserver command. It adds │
# │                                        │ automatic serving of static files.      │
# └────────────────────────────────────────┴─────────────────────────────────────────┘



########################################################################################
################################ Django Templates ######################################
########################################################################################

# A template contains the static parts of the desired HTML output as well as some
# special syntax describing how dynamic content will be inserted.

# Django ships built-in backends for its own template system, called the Django
# template language (DTL), and for the popular alternative Jinja2.

# Rendering replaces variables with their values, which are looked up in the context,
# and executes tags.

# The syntax of the Django template language involves four constructs.


# -----------
# Variables
# -----------

# A variable outputs a value from the context, which is a dict-like object mapping keys
# to values.

# Variables are surrounded by {{ and }} like this:

# My first name is {{ first_name }}. My last name is {{ last_name }}.
# With a context of {'first_name': 'John', 'last_name': 'Doe'}, this template renders:
# My first name is John. My last name is Doe.

# If a variable resolves to a callable, the template system will call it with no
# arguments and use its result instead of the callable.


# ------
# Tags
# ------

# Tags provide arbitrary logic in the rendering process.

# This definition is deliberately vague. For example, a tag can output content, serve
# as a control structure e.g. an "if" statement or a "for" loop, grab content from a
# database, or even enable access to other template tags.

# Tags are surrounded by {% and %} 

# Most tags accept arguments:
# {% cycle 'odd' 'even' %}

# Some tags require beginning and ending tags:
# {% if user.is_authenticated %}Hello, {{ user.username }}.{% endif %}


# --------
# Filters
# --------

# Filters transform the values of variables and tag arguments.

# They look like this:

# {{ django|title }}
# With a context of {'django': 'the web framework for perfectionists with deadlines'},
# this template renders to:
# The Web Framework For Perfectionists With Deadlines

# Some filters take an argument:
# {{ my_date|date:"Y-m-d" }}


# --------
# Comments
# --------

# Comments look like this:

# {# this won't be rendered #}

# A {% comment %} tag provides multi-line comments.


# --------
# Comments
# --------

# Templates allow us to define HTML documents with dynamic content, where the dynamic
# content is set by Django based on data we generate in our views, which we then pass
# into our templates with the render function for example.

# The interpolation syntax {{ }} is used to render a value in the HTML document.

# We can also use filters optionally if we want to, to adjust the look or the
# formatting of certain values.

# Besides interpolation, we also have tags.
#    - For example, the {% for %} tag for repeating content and rendering a list of
#    content based on some data.
#    - We also have the {% if %} tag to render content conditionally.

# And then we have this important feature of template inheritance where we define a
# base template with some blocks reserved in them, which will be replaced by the
# inheriting templates.

# And we then do inherit by using the {% extends %} tag and pointing at the base
# template,

# We insert the block tags in inheriting template as well to inject content into the
# base template. We can inject anything - some text, some HTML tags or also some static
# file imports.

# For placing our templates, we use this best practice structure of repeating the app
# name in the app specific templates folder to avoid name clashes and we're doing the
# same for static files.

# And we also learned about the feature of including template files to {% include %}
# snippets into our templates and have nice feature which helps us with reusing code
# and the whiting code duplication.

# The overall goal with that is to keep our views files lean and to really focus on
# the logic for extracting and transforming data here and not on formatting and
# constructing HTML code. That's the task of the template.




########################################################################################
######################## Building Static URLs Dynamically ##############################
########################################################################################

# Imagine, that you want to build a static URL where some part of the URL (e.g. the
# filename) is actually stored in a variable that's exposed to the template.

# So you might want to build the URL like this:

# {% static "my_path/to/" + the_file %}

# Here, "the_file" would be a variable holding the actual filename.

# The above code would fail.

# Instead, you can use the "add" filter provided by Django to construct this path
# dynamically:

# {% static "my_path/to/"|add:the_file %}



########################################################################################
################################ Django Settings #######################################
########################################################################################

# ----------
# TEMPLATES
# ----------

# A list containing the settings for all template engines to be used with Django.

# Each item of the list is a dictionary containing the options for an individual engine.

# Here's a setup that tells the Django template engine to load templates from the
# templates subdirectory inside each installed application:

# TEMPLATES = [
#     {
#         "BACKEND": "django.template.backends.django.DjangoTemplates",
#         "APP_DIRS": True,
#     },
# ]

# The "DIR" key specifies directories where the template engine should look for
# template source files, in search order.

# The "APP_DIRS" key specifies Whether the engine should look for template source
# files inside installed applications.


# -----------------
# STATICFILES_DIRS
# -----------------

# This setting defines the additional locations the staticfiles app will traverse

# STATICFILES_DIRS = [
#     "/home/special.polls.com/polls/static",
#     "/home/polls.com/polls/static",
#     "/opt/webfiles/common",
# ]



########################################################################################
########################## HttpRequest and HttpResponse ################################
########################################################################################

# Django uses request and response objects to pass state through the system.

# When a page is requested, Django creates an HttpRequest object that contains
# metadata about the request. Then Django loads the appropriate view, passing the
# HttpRequest as the first argument to the view function. Each view is responsible for
# returning an HttpResponse object.

# HttpRequest and HttpResponse are defined in the django.http module.

# In contrast to HttpRequest objects, which are created automatically by Django,
# HttpResponse objects are your responsibility. Each view you write is responsible for
# instantiating, populating, and returning an HttpResponse.

# Passing iterators

# You can pass HttpResponse an iterator rather than strings. HttpResponse will consume
# the iterator immediately, store its content as a string, and discard it. Objects with
# a close() method such as files and generators are immediately closed. If you need the
# response to be streamed from the iterator to the client, you must use the
# StreamingHttpResponse class instead.


########################################################################################
################################### Django Tips ########################################
########################################################################################


# ------------------------
# Database Design
# ------------------------

# You will continuously be using Django's Model to design the database schema. Because
# the schema has such a big impact on the rest of the project it's important to make
# sure you've designed it correctly. You'll need to be very comfortable with Django's
# Model to up-skill in database design. This will require you to understand all the
# different types of table relations such as Foreign Keys, OneToOneFields, and
# ManyToManyFields.

# A good understanding of database design is the foundation of having a good
# understanding of Django.


# ---------------------------------
# Authentication and Authorization
# ---------------------------------

# The first step is to understand the difference between authentication and
# authorization is. I recommend you to start by learning the built-in authentication
# provided by Django. Django's auth module contains a lot of views and forms that make
# up the authentication logic. Going through that code and understanding what each form
# and view does will give you a good starting point for how it works underneath the
# hood.

# While learning the built-in authentication it would also be good to learn the
# different types of authentication such as session and token authentication. If you
# have a good understanding of these then you might want to look at JWT authentication.

# If you have a solid understanding of authentication you'll then want to start going
# through the most commonly used packages such as Django AllAuth. You'll most likely
# make use of third-party packages to handle authentication because it's very
# repetitive. So start becoming familiar with the available packages and what might be
# best for your use-case.


# ------------------------
# Flow of data
# ------------------------

# Part of understanding the flow of data is understanding how data moves between the
# user and the database. This means understanding how data is retrieved from the
# database, passed into the view, and displayed in the template. Likewise from the other
# way around - understanding data being passed into a form, submitted to the view, and
# stored in the database.

# Take for example the Create action. To implement this action you will need to
# implement a form that takes in data and creates a resource (normally through a Django
# model). Django's Class-Based Views are very good at minimizing the amount of code
# written in CRUD views.


# ------------------------------------
# Static and media file configuration
# ------------------------------------

# One of the more challenging concepts is that of static and media files. This is
# because the setup is different depending on whether you're in local development or
# production. Understanding the difference between the two is important. I also
# recommend learning about the S3 protocol and why it's advantageous to store your files
# on a separate server using a service such as Digital Ocean Spaces.


# -----------
# Deployment
# -----------

# This is one of the most important sections of web development. Today there are many
# services you can use to deploy your Django project, but what's important to understand
# is the fundamentals of how a Django server is run in production. A traditional setup
# would involve manually setting up gunicorn and nginx on a server. A more modern
# approach would be to use Docker and deploy the docker container.


# --------------------------------
# Integrating with 3rd party APIs
# --------------------------------

# If you're able to integrate with APIs such as GitHub, Stripe, Slack, Twitter, and many
# others, you're showing that you understand almost all of the fundamental aspects of
# Django.

# Today there are entire businesses built on top of other companies' APIs. So this skill
# is a big one for me, and I think a lot of other companies that leverage APIs.


# -------
# Docker
# -------

# Docker is a great tool for creating consistent environments between team members. If
# you're joining a large team you'll most likely be working with Docker so developing
# this skill beforehand will make your life easier.


# --------------
# Building APIs
# --------------

# The Django Rest Framework is by far the most used project for building APIs. There's
# an entire ecosystem of packages that integrate with the DRF for various functionality.

# This step is definitely a challenging learning curve and I'd recommend you take it
# slow if you're struggling. Understanding the core of Django is much more important
# before diving into the DRF.


# -------------
# Task Queuing
# -------------

# This is definitely the most project-dependent skill. Some projects don't have any need
# for asynchronous tasks. It's also a very difficult skill to master. A lot of
# developers have shared their knowledge on asynchronous tasks because it's constantly
# provided a set of new challenges and pains to deal with. I would consider this skill
# an entire area to specialize in.





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

# Getting started with oh-my-zsh
# https://dev.to/joebui/getting-started-with-oh-my-zsh-3ecl

# Configuring a Django project with uv
# https://medium.com/@hmbarotov/configuring-a-django-project-with-uv-548f15ccbc63

#    uv init --package django_uv

#    uv add django

#    uv add --dev django-debug-toolbar

#    uv add --group prod gunicorn

#    uv sync

#    uv run django-admin startproject django_project .

#    uv run manage.py runserver

#    # Apply initial migrations
# # This command applies database migrations, setting up the necessary tables. # By
# default, Django uses an SQLite database stored in a file named db.sqlite3 # in your
# project's root directory if no other database is configured.

#    uv run manage.py migrate

#    uv run manage.py startapp books


# Django Key Concepts
# https://medium.com/@iamyathz/django-key-concepts-368f2370bc67

# 7 concepts you should know to get a job as a Django developer
# https://justdjango.com/blog/7-concepts-to-get-a-job

# Important Django Concepts for Developers
# https://edu.koderbox.com/important-django-concepts-for-developers/

