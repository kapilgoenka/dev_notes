# Python (Misc)




## macOS System Python


macOS System Python refers to the python installed by Xcode Command Line Tools.

This python instllation is a 'framework' build.

This can be verified by running the command below. If it returns an empty string or
None, it's not a framework build. If it returns a value (like 'Python' or 'Python3'),
it's a framework build. python3 -c "import sysconfig;
print(sysconfig.get_config_var('PYTHONFRAMEWORK'))" Python3

To see where the Python framework is actually installed, run:
python3 -c "import sys; print(sys.prefix)"
/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9

You can find the REAL Python executable at something like:
/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/bin/python3

You can check what executables Apple actually included with their Python
installation by running:
ls -la /Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/bin/



## [macOS System Python] User-Specific Package Location


MacOS comes with /usr/bin/python3 and /usr/bin/pip3 pre-installed.

They are actually small "shim" binaries provided by Apple's xcode-select system.

Besides these, many common developer tools in /usr/bin, such as git, swiftc, and
clang, are also shim binaries.

This can be confirmed by running:
otool -L /usr/bin/python3
/usr/bin/python3:
```python
	# /usr/lib/libxcselect.dylib (compatibility version 1.0.0, current version 1.0.0)
	# /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1356.0.0)
```

These shims load libxcselect.dylib to dynamically locate and execute the real versions
of these tools within the active Xcode or Command Line Tools installation. This allows
```python
for flexibility in managing multiple Xcode versions and ensures that the correct tools
```

are always used. If XCode Command Line Tools are not installed, running the shims
triggers a popup for install.

Installing XCode Command Line Tools makes shims like `python3` & `pip3` functional.
However, upgraging pip using `python3 -m ensurepip --upgrade` installs the upgraded
version in the location site.USER_BASE, which defaults to ~/Library/Python/X.Y for
MacOS. Similarly, any packages installed using pip (e.g. `pip3 install streamlit`) are
also installed in the site.USER_BASE location.

Upon upgrading pip or installing a package, if pip finds that USER_BASE/bin is not in
$PATH, it asks you add it to $PATH.

Sequence of steps that led to this export line: 1. Xcode Command Line Tools provided
Python 3.9 2. You ran `python3 -m ensurepip --upgrade` using that python. This command
installed pip to your user directory. 4. You added the export line to your .zshrc as
per output of above command.

```bash
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
```



## Framework vs. Non-Framework Build for Python


On macOS, a "framework build" of Python refers to an installation where Python is
packaged as a macOS Framework. This type of installation is common when using
installers from python.org or the XCode Command Line Tools.

Characteristics: Often installed by official Python installers. Owned by the 'root'
account, meaning modifications may require sudo/admin privileges. Integrated with
macOS's framework system. Designed to allow applications to embed and use Python,
especially those with graphical user interfaces (GUIs).

A "non-framework build" on macOS, often called a "source build," means Python is
compiled and installed directly from its source code, usually into a location like
/usr/local/bin or a user-specific directory.

Characteristics:
  Installed by compiling from source code.
  Owned by the account that performed the installation, allowing easier
  modification.
  Provides more control over the compilation process and potential
  customizations.
  Intended for command-line use and general development.



## USER_BASE and USER_SITE


USER_BASE and USER_SITE are Python's standard locations for user-specific package
installations (as opposed to system-wide installations). USER_BASE and USER_SITE
values are set by the site module, which is imported by default when the Python
interpreter starts.

The 'PYTHONUSERBASE' environment variable is the primary mechanism to explicitly
control USER_BASE. If it is not set, Python uses platform-specific default locations
```python
for USER_BASE (~/Library/Python/X.Y)
```

python3 -m site --user-base
Shows USER_BASE for Xcode-installed Python
/Users/kapil/Library/Python/3.9

python3 -m site --user-site
Shows USER_SITE for Xcode-installed Python
/Users/kapil/Library/Python/3.9/lib/python/site-packages

python3.14 -m site --user-base
Shows USER_BASE for UV-installed Python
/Users/kapil/.local

python3.14 -m site --user-site
Shows USER_SITE for UV-installed Python
/Users/kapil/.local/lib/python3.14/site-packages

When they're used: `pip install --user <package>` installs to these locations (on
macos, when using the Xcode-installed python, even running without --user installs to
the "user installation" location, with the message "Defaulting to user installation
because normal site-packages is not writeable") Executables go in USER_BASE/bin Python
packages go in USER_SITE

Why they exist:
  Allows installing packages without sudo/admin privileges
  Keeps user packages separate from system packages
```python
  Useful when you don't have write access to system directories
```



## Python sys.path


A fundamental concept in Python

sys.path is a list of directory paths that Python searches when you use import
statements.

sys.path is: - A list of directories python searches (first to last) when you use
```python
import statements. First match wins. - Can be modified at runtime - Controls where
```

Python finds modules - Virtual environments work by adding their `site-packages` to
sys.path - UV's --with flag works by manipulating sys.path to include multiple
locations



## Source Distribution and Binary Distribution in Python


When you build a Python package, you typically create two types of distributions:

```python
  1. Source Distribution (sdist) - .tar.gz
```

```python
     What it is:
        - A compressed archive of your source code as-is
        - Contains everything needed to build the package
```

```python
     Contents:
        - All your source files (main.py, tests/, etc.)
        - pyproject.toml with build instructions
        - README, LICENSE, etc.
        - Basically your entire project directory
```

```python
     Installation process:
        User runs: pip install uv_cats-0.1.0.tar.gz
               ↓
           1. Extract the archive
           2. Read [build-system] from pyproject.toml
           3. Install build dependencies (hatchling)
           4. Run the build backend to create a wheel
           5. Install the wheel
```

```python
     Pros:
        - ✅ Works on any platform
        - ✅ Transparent - you can see all the source code
```

```python
     Cons:
        - ❌ Slower to install (needs to build first)
        - ❌ Requires build tools to be available
        - ❌ Can fail if build dependencies are missing
```


```python
  2. Binary Distribution (wheel) - .whl file
```

```python
     What it is:
        - A pre-built package ready to install
        - No building required
```

Breaking down the filename: uv_cats-0.1.0-py3-none-any.whl - uv_cats - package name -
0.1.0 - package version - py3 - Works with Python 3 - none - No specific ABI
(Application Binary Interface) required - any - Works on any platform (Linux, Windows,
Mac)

```python
     Contents:
        - Ready-to-use Python files
        - Metadata in .dist-info/ directory
        - Entry points already configured
        - No build files needed
```

```python
     Installation process:
        User runs: pip install uv_cats-0.1.0-py3-none-any.whl
               ↓
           1. Extract the wheel
           2. Copy files to site-packages
           3. Install entry points (scripts)
           4. Done!
```

```python
     Pros:
        - ✅ Fast installation (no build step)
        - ✅ Reliable (pre-built, tested)
        - ✅ No build tools required
```

```python
     Cons:
        - ❌ Platform-specific for packages with C extensions
        - ❌ Larger file size (sometimes)
```


  Real-world analogy:

```python
     Source Distribution = Recipe with ingredients
        - You get flour, eggs, sugar
        - You need to bake the cake yourself
        - Takes time and requires an oven (build tools)
```

```python
     Binary Distribution = Pre-made cake
        - Already baked and ready to eat
        - Just open and serve
        - Fast and convenient
```


  What gets uploaded to PyPI?

```python
     Typically both:
        uv build       # Creates both .tar.gz and .whl
        uv publish     # Uploads both to PyPI
```

```python
     This gives users the best of both worlds:
        - Fast installation (wheel)
        - Fallback option (sdist) if wheel doesn't match
```


  What uv / pip prefer:

```bash
     When you run `pip install requests` or `uv add requests`:
        1. First choice: Look for a compatible wheel
          - Fast installation
          - No build required
        2. Fallback: Download source distribution
          - Build a wheel locally
          - Then install the wheel
```



## Python Package Index (PyPI)


The Python Package Index, commonly known as PyPI, is the official third-party software
repository for the Python programming language hosted at pypi.org.

PyPI serves as a central hub for Python developers to share their projects and make
them available to the community. By using PyPI, you can leverage a vast array of pre-
built solutions to accelerate your development process, ensuring you don't have to
"reinvent the wheel" for common tasks.

Whether you're looking for web development frameworks, data analysis tools, or
utilities for scientific computing, PyPI has something for every Python programmer.



## Rust-Based Tools in Python Tooling Ecosystem


Recently, a few exciting tools built with the Rust programming language have appeared
in the Python tooling ecosystem.

Popular examples:
  1. Ruff — a linter and code formatter for Python
  2. UV - an extremely fast Python package and project manager

The main idea behind these tools is to accelerate your Python workflow by speeding up
your project management actions. For example, Ruff is 10 to 100 times faster than
linters like Flake8 and code formatters like Black. Similarly, for package
installation, uv is 10 to 100 times faster than pip.



## aiohttp


aiohttp is a popular Python library that allows you to write asynchronous HTTP clients
and servers. Think of it like Python's requests library but turbocharged with the
power of asynchronous programming.

It's built on top of Python's asyncio framework, which means it can handle a large
number of requests concurrently without waiting for each one to complete before moving
to the next.

aiohttp is a must-have tool in your Python toolkit if you're dealing with web
scraping, API requests, or any other task that requires making many HTTP requests.



