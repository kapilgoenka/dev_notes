# NodeJS


When you install nvm using its standard installation script, it automatically appends
these lines to your shell configuration file (.zshrc for zsh, .bashrc for bash, etc.)
so that nvm is available every time you open a new terminal.

These lines need to be in your .zshrc because nvm is actually a shell function, not a
binary executable, so it must be loaded into each shell session.

Install URL:
https://github.com/nvm-sh/nvm?tab=readme-ov-file#manual-upgrade

Install / Update Cmd:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # nvm bash_completion
```




