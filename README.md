# Dumb Nvim

A minimal and extensible [Neovim](https://neovim.io/) configuration. The goal of this repo is to provide a simple, clean, and easy-to-understand setup built with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Preview

![Screenshot init.lua](https://github.com/user-attachments/assets/0792c340-86cb-46d2-9590-dbd81f917543)

## Clone & Run

Clone this repository into your Neovim config directory:

```bash
git clone https://github.com/ShiMigui/dumbnvim.git ~/.config/nvim
```

Then just run:

```bash
nvim
```

Lazy.nvim will bootstrap itself and install all dependencies.

## Dependencies

To run this configuration, you need:

* [lazy.nvim](https://github.com/folke/lazy.nvim) dependencies (see their README)
* [treesitter-cli](https://github.com/tree-sitter/tree-sitter)
* [cmake](https://cmake.org/)
* **pip / npm / cargo** installed (or all of them) - used by [mason.nvim](https://github.com/williamboman/mason.nvim) to manage LSPs, DAPs, and formatters.

## Project Tree

![Screenshot tree](https://github.com/user-attachments/assets/56355fe1-fa43-4ba9-a220-369d66d45fa6)
```
.
├── README.md **YOU ARE HERE :)**
├── init.lua (entrypoint of the config)
├── lazy-lock.json (locks dependencies versions, like package-lock.json)
└── lua (our modules)
    ├── config 
    │   ├── keymap.lua (keymaps functions and helper `map`)
    │   └── theme.lua (colors, lualine colors, bg/fg)
    ├── options.lua (loads lazy and dependencies)
    └── plugin (plugin configs split for readability)
        ├── lualine.lua
        ├── mason-conform.lua
        ├── mason-lspconfig.lua
        ├── mini.lua
        ├── nvim-cmp.lua
        ├── nvim-colorizer.lua
        ├── nvim-treesitter.lua
        └── telescope.lua
```

## Plugins Used

* [lazy.nvim](https://github.com/folke/lazy.nvim) → Plugin manager
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) → Syntax highlighting & indentation
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) + [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim) → Fuzzy finder
* [mason.nvim](https://github.com/williamboman/mason.nvim) + [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) + [mason-conform](https://github.com/zapling/mason-conform.nvim) → LSP/DAP/formatter installer
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) → Config for built-in LSP
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + sources → Autocompletion
* [LuaSnip](https://github.com/L3MON4D3/LuaSnip) → Snippets engine
* [mini.nvim](https://github.com/echasnovski/mini.nvim) → Collection of small, independent plugins
* [nvim-lualine](https://github.com/nvim-lualine/lualine.nvim) → Statusline
* [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) → Icons
* [nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua) → Highlight color codes

My english is not good, so if have any issues contact me! ;)
