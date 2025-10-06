vim.g.mapleader = "\\"

local main_cfg = require("options")
main_cfg.lazy_clone()
main_cfg.setup()

vim.cmd("colorscheme tokyonight-night") -- This is the theme name; change or remove it if needed

vim.diagnostic.config({ signs = true, underline = true, virtual_text = true, update_in_insert = true })

local o = vim.o
o.number = true
o.relativenumber = true
o.termguicolors = true
o.cursorline = true
o.scrolloff = 5
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.undofile = true
o.swapfile = false
o.updatetime = 250
o.timeoutlen = 500
o.wrap = true
o.linebreak = true
o.cmdheight = 0
o.winborder = "rounded"
