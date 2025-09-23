vim.g.mapleader = "\\"

local function keymap(mode, cmd, callback, desc, buffer)
	vim.keymap.set(mode, cmd, callback, { desc = desc, buffer = buffer })
end

vim.fn.on_attach_lsp = function(_, bfnr)
	local bf, dg = vim.lsp.buf, vim.diagnostic
	keymap("n", "gd", bf.definition, "Go to definition", bfnr)
	keymap("n", "gD", bf.declaration, "Go to declaration", bfnr)
	keymap("n", "gi", bf.implementation, "Go to implementation", bfnr)
	keymap("n", "gr", bf.references, "Go to references", bfnr)
	keymap("n", "K", bf.hover, "Show documentation", bfnr)
	keymap("n", "grn", bf.rename, "Rename", bfnr)
	keymap("n", "gca", bf.code_action, "Code action", bfnr)
	keymap("n", "[d", dg.goto_prev, "Prev diagnostic", bfnr)
	keymap("n", "]d", dg.goto_next, "Next diagnostic", bfnr)
	keymap("n", "<leader>e", dg.open_float, "Show diagnostics", bfnr)
	keymap("n", "<leader>q", dg.setloclist, "Diagnostics list", bfnr)
end

vim.fn.lualine_macro = function()
	local r = vim.fn.reg_recording()
	return r ~= "" and "@" .. r or ""
end

vim.fn.telescope_keymaps = function()
	local tb, path = require("telescope.builtin"), vim.fn.stdpath("config")
	tb.find_in_nvim = function()
		tb.find_files({ cwd = path })
	end

	keymap("n", "<leader>fn", tb.find_in_nvim, "Telescope find files in Neovim")
	keymap("n", "<leader>ff", tb.find_files, "Telescope find files")
	keymap("n", "<leader>fg", tb.live_grep, "Telescope live grep")
	keymap("n", "<leader>fb", tb.buffers, "Telescope buffers")
	keymap("n", "<leader>fh", tb.help_tags, "Telescope help tags")
end

keymap("v", "<space>x", "<cmd>.lua<cr>", "Execute Lua code in selection")
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", "Clear search highlight")
keymap("i", "jk", "<Esc>", "Exit insert mode")

local function colors()
	local fg, bg = "#FFFFFF", "#000000"
	local primary, secondary, tertiary = "#FF5555", "#50FA7B", "#BD93F9"

	vim.highlight.lualine = {
		normal = {
			a = { bg = primary, fg = bg },
			b = { bg = secondary, fg = bg },
			c = { bg = bg, fg = tertiary },
			x = { bg = bg, fg = tertiary },
			y = { bg = secondary, fg = bg },
			z = { bg = primary, fg = bg },
		},
	}
	return { fg = fg, bg = bg }
end

local hl, theme = vim.api.nvim_set_hl, colors()
hl(0, "Normal", theme)
hl(0, "NormalFloat", theme)

require("options")
