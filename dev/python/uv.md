# UV

* A high-speed package and project manager for Python, written in Rust.

* An all-in-one tool for Python project management:
    * Install and manage multiple Python versions
    * Create virtual environments
    * Efficiently handle project dependencies
    * Reproduce working environments
    * Build and publish a project

* UV integrates into one tool most of the functionality provided by tools like pip, pip-tools, pipx, poetry, pyenv, twine, virtualenv, and more.

* UV can build and publish Python packages to package repositories like PyPI, supporting a streamlined process from development to distribution

* UV can scaffold a full Python project, including the root directory, Git repository, virtual environment, pyproject.toml, README, and more.

* When it comes to managing your project's dependencies, uv makes your life easier with a clean workflow. This workflow allows you to lock your project's dependencies so that other developers can reproduce your environment exactly and contribute to your code without much setup effort.



## Homebrew vs UV

* Homebrew and UV are fundamentally different tools that serve different purposes.

* Homebrew is a general-purpose package manager for macOS, while UV is a python-specific package and project manager. You would use Homebrew to install system-level tools, including UV itself, while UV is used for managing Python packages and projects, a task traditionally handled by pip.



## UV Install Cmd


curl -LsSf https://astral.sh/uv/install.sh | sh



## UV Path Additions


This line sources (executes) a script called `env` located in your $HOME/.local/bin/
directory.

It is added by the UV install command, both to .zshrc and .bashrc

The file ~/.local/bin/env is a shell script created by the uv installer to manage the
PATH environment variable.

When uv is installed, it places its executables (like uv itself, uvx, env, and
env.fish) into the ~/.local/bin directory by default.

The `env` script ensures that ~/.local/bin is added to your PATH if it's not already
present. This allows you to execute uv and its associated tools directly from your
terminal without specifying the full path to the executable.

Breaking it down:

. - This is the source command (shorthand for source). It executes the script in your
current shell session rather than in a subshell, meaning any environment variables or
functions defined in that script will persist in your current shell.

So essentially, when your shell starts up (since this is in .zshrc), it runs the `env`
script, which likely sets up environment variables, PATH modifications, or other shell
configurations. This is a common pattern for keeping your .zshrc cleaner by moving
some configuration logic into separate files.

```bash
. "$HOME/.local/bin/env"
```



## UV Shell Completion


```bash
eval "$(uv generate-shell-completion zsh)"
```



## UV Project


Projects help manage Python code spanning multiple files.

When creating projects, uv supports two basic templates:
   1. Applications
   2. Libraries

By default, uv will create a project for a non-packaged application. The --lib flag
can be used to create a project for a library instead.

There are two types of application projects: "packaged" and "non-packaged":

   You probably need a packaged-project if you want to:
```python
      - Add commands to the project
      - Distribute the project to others
      - Use a src and test layout
      - Write a library
```

   You probably do not need a non-packaged project if you are:
```python
      - Writing scripts
      - Building a simple application
      - Using a flat layout
```

You can create a new Python project using the `uv init` command:
```bash
   $ uv init hello-world
   $ cd hello-world
```

Initial project structure:
   .
```
   ├── .git
   ├── .gitignore
   ├── .python-version
   ├── README.md
   ├── main.py
   └── pyproject.toml
```

The --package flag can be used to create a packaged application with the
default build system. In this case, the source code is moved into a src
directory with a module directory and an __init__.py file:

```bash
   $ uv init --package example-pkg
   $ tree example-pkg
      .
      ├── .git
      ├── .gitignore
      ├── .python-version
      ├── README.md
      └── pyproject.toml
      └── src
           └── tree example_pkg
                └── __init__.py
```

   Inside pyproject.toml:
```python
      [build-system]
      requires = ["uv_build>=0.9.7,<0.10.0"]
      build-backend = "uv_build"
```

A library provides functions and objects for other projects to consume. Libraries are
intended to be built and distributed, e.g., by uploading them to PyPI.

Using --lib implies --package. Libraries always require a packaged project.

```bash
$ uv init --lib example-lib
```

As with a packaged application, a src layout is used. A py.typed marker is included to
indicate to consumers that types can be read from the library:

```bash
   $ uv init --lib example-lib
   $ tree example-lib
      .
```

```
      ├── .git
      ├── .gitignore
      ├── .python-version
      ├── README.md
      └── pyproject.toml
      └── src
           └── tree example_lib
                └── py.typed
                └── __init__.py
```

   Inside pyproject.toml:
```python
      [build-system]
      requires = ["uv_build>=0.9.7,<0.10.0"]
      build-backend = "uv_build"
```

The created module defines a simple API function:

__init__.py

```python
def hello() -> str:
    return "Hello from example-lib!"
```

And you can import and execute it using uv run:


cd example-lib
uv run python -c "import example_lib; print(example_lib.hello())"
Hello from example-lib!


In addition to the files created by `uv init`, uv will create a virtual
environment and uv.lock file in the root of your project the first time you run a
project command, i.e., uv run, uv sync, or uv lock.
   .
```
   ├── .venv
   │   ├── bin
   │   ├── lib
   │   └── pyvenv.cfg
   ├── .git
   ├── .gitignore
   ├── .python-version
   ├── README.md
   ├── main.py
   ├── pyproject.toml
   └── uv.lock
```

### pyproject.toml

Python project metadata is defined in a pyproject.toml file.

### .python-version

The .python-version file contains the project's default Python version. This file
tells uv which Python version to use when creating the project's virtual
environment.

### .venv

The .venv folder contains your project's virtual environment, a persistent Python
environment that is isolated from the rest of your system. This is where uv will
install your project's dependencies. Automatically excluded from git with an internal
.gitignore file

Prior to every `uv run` invocation, uv will verify that the lockfile is up-to-date
```python
with the pyproject.toml, and that the environment is up-to-date with the lockfile,
```

keeping your project in-sync without the need for manual intervention. uv run
guarantees that your command is run in a consistent, locked environment.

### Optional dependencies


It is common for projects that are published as libraries to make some features
optional to reduce the default dependency tree. For example, Pandas has an "excel"
extra and a "plot" extra to avoid installation of Excel parsers and matplotlib unless
someone explicitly requires them.

Optional dependencies are specified in [project.optional-dependencies], a TOML table
that maps from extra name to its dependencies, following dependency specifiers syntax.

pyproject.toml

```python
   [project]
   name = "pandas"
   version = "1.0.0"
```

```python
   [project.optional-dependencies]
   plot = [
```


```python
     "matplotlib>-3.6.3"
   ]
   excel - [
     "odfpy>=1.4.1",
     "openpyxl>=3.1.0",
     "python-calamine>=0.1.7",
     "pyxlsb>=1.0.10",
     "xlrd>=2.0.1",
     "xlsxwriter>=3.0.5"
   ]
```

To add an optional dependency, use the --optional <extra> option:
   uv add httpx --optional network



## Build systems


A build system determines how the project should be packaged and installed. Projects
may declare and configure a build system in the [build-system] table of the
pyproject.toml.

uv uses the presence of a build system to determine if a project contains a
package that should be installed in the project virtual environment. If a build system
is not defined, uv will not attempt to build or install the project itself, just its
dependencies. If a build system is defined, uv will build and install the project into
the project environment.

When using `uv build`, uv acts as a build frontend and only determines the Python
version to use and invokes the build backend. The details of the builds, such as the
included files and the distribution filenames, are determined by the build backend, as
defined in [build-system]. Information about build configuration can be found in the
respective tool's documentation.



## Managed and system Python installations in UV


uv refers to Python versions it installs as managed Python installations and all
other Python installations as system Python installations.

uv does not distinguish between Python versions installed by the operating system
vs those installed and managed by other tools. For example, if a Python installation
is managed with pyenv, it would still be considered a system Python version in uv.

The available Python versions are frozen for each uv release. To install new Python
versions, you may need upgrade uv.



## UV Lock File (uv.lock)


A cross-platform lockfile that contains information about your project's dependencies.
This file ensures that other developers can quickly and exactly reproduce your working
environment.

Unlike the pyproject.toml, which is used to specify the broad requirements of your
project, the lockfile contains the exact resolved versions that are installed in the
project environment. This file should be checked into version control, allowing for
consistent and reproducible installations across machines.

Additionally, it ensures when deploying the project as an application that the exact
set of used package versions is known.

The lockfile is automatically created and updated during uv invocations that use the
project environment, i.e., uv sync and uv run. The lockfile may also be explicitly
updated using uv lock.

uv.lock is a human-readable TOML file but is managed by uv and should not be edited
manually. The uv.lock format is specific to uv and not usable by other tools.

As a counterpart, syncing is the process of installing the required packages from the
lockfile into the project's development environment.

Both locking and syncing processes are automatically handled by uv. For example, when
you execute uv run, the project is locked and synced before the command is invoked.

To see this in action, you can go ahead and remove the .venv/ folder from the
project's root directory. `uv run` will recreate it.



## UV Tools


### The uv tool interface


uv includes a dedicated interface for interacting with tools. Tools can be invoked
without installation using uv tool run, in which case their dependencies are installed
in a temporary virtual environment isolated from the current project.

Because it is very common to run tools without installing them, a uvx alias is
provided for uv tool run — the two commands are exactly equivalent. For brevity, the
documentation will mostly refer to uvx instead of uv tool run.

Tools can also be installed with uv tool install, in which case their executables
are available on the PATH — an isolated virtual environment is still used, but it
is not removed when the command completes.

### The bin directory


Tool executables are symlinked into the user bin directory - ~/.local/bin

The bin directory must be in the PATH variable for tool executables to be available
```bash
from the shell. If it is not in the PATH, a warning will be displayed. The uv tool
```

update-shell command can be used to add the bin directory to the PATH in common shell
configuration files.

### Overwriting executables


Installation of tools will not overwrite executables in the bin directory that were
not previously installed by uv. For example, if pipx has been used to install a tool,
uv tool install will fail. The --force flag can be used to override this behavior.

### Executing vs installing tools


In most cases, executing a tool with uvx is more appropriate than installing the tool.
Installing the tool is useful if you need the tool to be available to other programs
on your system, e.g., if some script you do not control requires the tool, or if you
are in a Docker image and want to make the tool available to users.

### Tool environments


When running a tool with uvx, a virtual environment is stored in the uv cache
directory and is treated as disposable, i.e., if you run uv cache clean the
environment will be deleted. The environment is only cached to reduce the overhead of
repeated invocations. If the environment is removed, a new one will be created
automatically.

When installing a tool with uv tool install, a virtual environment is created in the
uv tools directory. The environment will not be removed unless the tool is
uninstalled. If the environment is manually deleted, the tool will fail to run.



## UV Python Versions


Upgrading Python versions

uv allows transparently upgrading Python versions to the latest patch release,
e.g., 3.13.4 to 3.13.5

uv does not allow transparently upgrading across minor Python versions, e.g.,
3.12 to 3.13, because changing minor versions can affect dependency resolution.

uv-managed Python versions can be upgraded to the latest supported patch
release with the python upgrade command



## UV Common Commands


Python versions
Installing and managing Python itself.

```
┌──────────────────────────┬───────────────────────────────────────────────────┐
│ Command                  │ Description                                       │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv python install        │ Install Python versions                           │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv python list           │ View available Python versions                    │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv python find           │ Find an installed Python version                  │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv python pin            │ Pin current project to a specific Python version  │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv python uninstall      │ Uninstall a Python version                        │
└──────────────────────────┴───────────────────────────────────────────────────┘
```


Projects
Creating and working on Python projects, i.e., with a pyproject.toml.

```
┌──────────────────────────┬───────────────────────────────────────────────────┐
│ Command                  │ Description                                       │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv init                  │ Create a new Python project                       │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv add                   │ Add a dependency to the project                   │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv remove                │ Remove a dependency from the project              │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv sync                  │ Sync project's dependencies with the environment  │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv lock                  │ Create a lockfile for project's dependencies      │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv run                   │ Run a command in the project environment          │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv run --isolated        │ Run a command in an isolated environment          │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv tree                  │ View the dependency tree for the project          │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv build                 │ Build project into distribution archives          │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv publish               │ Publish project to a package index                │
└──────────────────────────┴───────────────────────────────────────────────────┘
│ uv format                │ Format Python code in the project                 │
└──────────────────────────┴───────────────────────────────────────────────────┘
```




Tools Running and installing tools published to Python package indexes, e.g., ruff or
black.

```
┌──────────────────────────┬───────────────────────────────────────────────────┐
│ Command                  │ Description                                       │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uvx / uv tool run        │ Run a tool in a temporary environment             │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv tool install          │ Install a tool user-wide                          │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv tool uninstall        │ Uninstall a tool                                  │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv tool list             │ List installed tools                              │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv tool update-shell     │ Update shell to include tool executables          │
└──────────────────────────┴───────────────────────────────────────────────────┘
```


Utility Managing and inspecting uv's state, such as the cache, storage directories, or
performing a self-update.

```
┌──────────────────────────┬───────────────────────────────────────────────────┐
│ Command                  │ Description                                       │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv cache clean           │ Remove cache entries                              │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv cache prune           │ Remove outdated cache entries                     │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv cache dir             │ Show the uv cache directory path                  │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv tool dir              │ Show the uv tool directory path                   │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv python dir            │ Show the uv installed Python versions path        │
├──────────────────────────┼───────────────────────────────────────────────────┤
│ uv self update           │ Update uv to the latest version                   │
└──────────────────────────┴───────────────────────────────────────────────────┘
```



## UV pyproject.toml file: [project.scripts] section


The [project.scripts] section in the TOML file defines command-line entry points that
get installed when someone installs your package.

Example:
```python
	[project.scripts]
	uv-cats = "main:main"
```

This tells the build backend (e.g. Hatchling): "Create a command-line script called
uv-cats". The script essentially does this:

  #!/usr/bin/env python
  # Auto-generated entry point script

```python
  from main import main
```


```python
  if __name__ == '__main__':
	  sys.exit(main())
```

Without the [project.scripts] section, users would need to know your internal module
structure in order to run the main.py script. With it, they can just run `uv-cats`
command, and it works!

What happens when you install the package?

Assume package name is 'uv-cats'.
When someone runs `pip install uv-cats` or `uv tool install uv-cats`, Python puts the
executable script in their PATH (like /usr/local/bin/uv-cats or similar)



## UV pyproject.toml file: [build-system] section


The [build-system] section tells Python packaging tools how to build your package -
specifically, which build tool to use and what dependencies it needs.

### Example configuration:


```python
  [build-system]
  requires = ["hatchling"]
  build-backend = "hatchling.build"
```

  This says:
```python
  1. "To build this package, you need Hatchling installed"
  2. "Use Hatchling as the build tool"
```

### What are build backends?


  Build backends are tools that know how to:
  - Read your pyproject.toml
  - Find your Python files
```python
  - Create wheel files (.whl)
  - Create source distributions (.tar.gz)
  - Install entry points (like our uv-cats command)
```

### Common build backends:


  1. Hatchling
  	- Modern, fast
```python
  	- Part of PyPA (Python Packaging Authority)
```

  	- Good defaults, minimal configuration

```python
  2. Setuptools (traditional, most common)
```

  	- The oldest and most widely used
  	- Lots of features and flexibility
  	- Sometimes requires more configuration

  3. Poetry
```python
  	- All-in-one tool (dependency management + building)
```

  	- Popular in modern projects

  4. Flit
  	- Designed for simplicity
  	- Best for pure Python packages

### Why do we need this?


```python
  [tool.hatch.build.targets.wheel]
  packages = ["."]
```

By default, Hatchling expects your code to be in a directory that matches your package
name. For example:

  uv_cats/
```
  ├── pyproject.toml
  └── uv_cats/          # Package directory matching project name
      ├── __init__.py
      └── main.py
```

```python
  This tells Hatchling: "Include Python files from the current directory (.) in the
  wheel."
```



## UV Cache Location


UV cache location: ~/.cache/uv/



## UV Cache Directory Structure


(version numbers in sub-directory names may vary)

~/.cache/uv/
```
  ├── archive-v0/          # Extracted packages (PERSISTENT)
  │   ├── <hash1>/
  │   │   └── lib/python3.14/site-packages/requests/
  │   └── <hash2>/
  │       └── lib/python3.14/site-packages/urllib3/
```

  |
```
  ├── builds-v0/           # Temporary environments (EPHEMERAL)
  │   └── .tmpXXXXXX/     # Created and deleted per run
```

  |
```
  ├── wheels-v5/           # Downloaded wheels (PERSISTENT)
  │   └── <hash>.whl
```

  |
```
  ├── sdists-v9/           # Downloaded source dists (PERSISTENT)
```

  |
```
  └── simple-v18/          # PyPI index cache (PERSISTENT)
```



## UV Package Cache Location


Downloaded packages are stored in UV's package cache (persistent) and reused:
~/.cache/uv/archive-v0/



## UV Temporary Environments Location


  Temporary environments are created in:
```python
     ~/.cache/uv/builds-v0/
```



## Sample UV Temporary Environment Structure


A temporary environment is a full Python virtual environment containing:
~/.cache/uv/builds-v0/ .tmpX44ntz/
```
        ├── bin/
        │   ├── python -> python3.14
        │   ├── python3 -> python3.14
        │   └── python3.14
        ├── lib/
        │   └── python3.14/
        │       └── site-packages/
        │           ├── requests/
        │           ├── urllib3/
        │           └── ... (dependencies)
        └── pyvenv.cfg
```



## `uv run --with`


`uv run --with` ALMOST ALWAYS creates a temporary environment, even when run inside a
UV project! The only expection is when the packages requested in the --with flag are
already in the project dependencies (along with compatible version for each).

```python
  If a temporary environment is used, it's python interpreter's sys.path is configured
```

  to include:
```python
     - Temporary environment location (for the Python interpreter)
     - Package cache (for --with packages)
     - Project's .venv/ (for project dependencies)
```

UV uses symlinks from it's package cache to temp environments, so it's extremely fast
and doesn't duplicate files. This design makes `uv run --with` perfect for one-off
scripts and automation - you get the benefits of isolation without the overhead of
managing virtual environments!

```python
     Traditional virtualenv:
        python -m venv myenv      # ~2 seconds
        source myenv/bin/activate
        pip install requests      # ~5 seconds
        python script.py
        deactivate
        rm -rf myenv              # Manual cleanup
        # Total: ~7+ seconds
```

```python
     UV's approach:
        uv run --with requests python script.py
        # First time: ~1 second
        # Subsequent: ~0.1 seconds ⚡
```

  Visual Representation

```
        ┌───────────────────────────────────────────┐
        │ uv run --with black script.py             |
        │ (inside a UV project)                     |
        │ (requests ALREADY in project)             │
        │ (black NOT in project)                    |
        ├───────────────────────────────────────────┤
        │                                           │
        │  ┌─────────────────────────────────────┐  │
        │  │ Temporary Environment               │  │
        │  │ ~/.cache/uv/builds-v0/.tmpXXXXXX    │  │
        │  │                                     │  │
        │  │ Contains:                           │  │
        │  │ - Python interpreter (isolated)     │  │
        │  │ - sys.path configured to find:      │  │
        │  │   • --with packages (cached)        │  │
        │  │   • Project packages (.venv)        │  │
        │  └─────────────────────────────────────┘  │
        │           │                  │            │
        │           │                  │            │
        │           ▼                  ▼            │
        │  ┌───────────────┐   ┌───────────────┐    │
        │  │ Project .venv │   │ Package Cache │    │
        │  │               │   │               │    │
        │  │ requests      │   │ black         │    │
        │  └───────────────┘   └───────────────┘    │
        │   (persistent)       (persistent)         │
        │                                           │
        └───────────────────────────────────────────┘

        ┌─────────────────────────────────────────────┐
        │ uv run --with "requests==2.31.0" script.py  │
        │ (inside a UV project)                       │
        │ (different version requested)               │
        ├─────────────────────────────────────────────┤
        │                                             │
        │   UV checks: Is requests in pyproject.toml? |
        |      Yes! Is version compatible?            │
        │      No! Project has >=2.32.5               │
        │                                             │
        │   → Create temporary environment            │
        │   → Install requested version               │
        │                                             │
        │   ┌─────────────────────────────────────┐   │
        │   │ Temporary Environment               │   │
        │   │ ~/.cache/uv/builds-v0/.tmpXXXXXX    │   │
        │   │                                     │   │
        │   │ Contains:                           │   │
        │   │ - Python interpreter (isolated)     │   │
        │   │ - sys.path configured to find:      │   │
        │   │   • --with packages (cached)        │   │
        │   │   • Project packages (.venv)        │   │
        │   └─────────────────────────────────────┘   │
        │           │                  │              │
        │           │ ← Not used       │ ← Used       │
        │           ▼                  ▼              │
        │   ┌───────────────┐   ┌───────────────┐     │
        │   │ Project .venv │   │ Package Cache │     │
        │   │               │   │               │     │
        │   │ requests      │   │ requests      |     │
        |   | (2.32.5)      |   | (2.31.0)      |     |
        │   └───────────────┘   └───────────────┘     │
        │    (persistent)       (persistent)          │
        └─────────────────────────────────────────────┘
```


```
        ┌───────────────────────────────────────────────────────────┐
        │ uv run --with requests script.py                          │
        │ (inside a UV project)                                     │
        │ (requests with compatible version ALREADY in project)     │
        ├───────────────────────────────────────────────────────────┤
        │                                                           │
        │   UV checks: Is requests in pyproject.toml?               │
        │      Yes! Version compatible?                             │
        │      Yes!                                                 │
        │                                                           │
        │   → Use existing .venv (optimization!)                    │
        │   → No temporary environment needed                       │
        │                                                           │
        │   ┌─────────────────────────────┐                         │
        │   │   Project .venv             │                         │
        │   │   ├── requests (2.32.5)     │ ← Import from here      │
        │   │   ├── urllib3               │                         │
        │   │   └── ...                   │                         │
        │   └─────────────────────────────┘                         │
        │                                                           │
        └───────────────────────────────────────────────────────────┘
```



## Running scripts


A Python script is a file intended for standalone execution, e.g., with
python <script>.py.

Using uv to execute scripts ensures that script dependencies are managed
without manually managing environments.

If your script has no dependencies, you can execute it with uv run
```bash
$ uv run example.py
```

Similarly, if your script depends on a module in the standard library,
there's nothing more to do:
```bash
$ uv run example.py
```

Your script can be read directly from stdin:
```bash
$ echo 'print("hello world!")' | uv run -
```

If your shell supports here-documents:
uv run - <<EOF
print("hello world!")
EOF

### Creating a Python script


Python recently added a standard format for inline script metadata.
It allows for selecting Python versions and defining dependencies.

Use uv init --script to initialize scripts with the inline metadata:
```bash
   $ uv init --script example.py --python 3.12
```

uv supports adding and updating inline script metadata for you.

Use uv add --script to declare the dependencies for the script:
```bash
   $ uv add --script example.py 'requests<3' 'rich'
```

This will add a script section at the top of the script declaring the dependencies
using TOML: # /// script # dependencies = [ #   "requests<3", #   "rich", # ] # ///

```python
         import requests
         from rich.pretty import pprint
```

```python
         resp = requests.get("https://peps.python.org/api/peps.json")
         data = resp.json()
         pprint([(k, v["title"]) for k, v in data.items()][:10])
```

### Running scripts with iniline dependencies


Scripts that declare inline metadata are automatically executed in
environments isolated from the project.

For example, given a script:

   example.py

   # /// script
```python
   # dependencies = [
   #   "httpx",
   # ]
   # ///
```

```python
   import httpx
```

```python
   resp = httpx.get("https://peps.python.org/api/peps.json")
   data = resp.json()
   print([(k, v["title"]) for k, v in data.items()][:10])
```

The invocation `uv run example.py` would run isolated from the project with only the
given dependencies listed.

### Entry points


Entry points are the official term for an installed package to advertise
interfaces. These include:

Command line interfaces
Graphical user interfaces
Plugin entry points

Projects may define command line interfaces (CLIs) for the project in the
[project.scripts] table of the pyproject.toml. Projects may define graphical user
interfaces (GUIs) for the project in the [project.gui-scripts] table of the
pyproject.toml. Projects may define entry points for plugin discovery in the
[project.entry-points] table of the pyproject.toml.



