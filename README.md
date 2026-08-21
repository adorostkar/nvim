# NeoVim configuration

This is my attempt to capture Neovim configuration on its own without depending
on Vim configuration.

I started the config from the beginning as a learning opportunity instead of
just following popular setups, so it may still have rough edges.

## Requirements

- Neovim 0.12 or newer
- Git, a C compiler, curl, tar, ripgrep, and a Nerd Font
- Language runtimes required by tools installed through Mason
- Optional: `ctags` for Tagbar and platform clipboard tooling for CodeSnap

## Installation

```sh
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}"
git clone https://github.com/adorostkar/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
nvim
```

Run `:MasonInstallAll` to install the configured language servers, formatter,
debugger, and tree-sitter CLI. Plugin versions are pinned in `lazy-lock.json`.
