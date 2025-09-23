local M = {}

M.map = function(mode, cmd, callback, desc, buffer)
	vim.keymap.set(mode, cmd, callback, { desc = desc, buffer = buffer })
end

M.on_attach_lsp = function(_, bfnr)
	local bf, dg = vim.lsp.buf, vim.diagnostic
	M.map("n", "gd", bf.definition, "Go to definition", bfnr)
	M.map("n", "gD", bf.declaration, "Go to declaration", bfnr)
	M.map("n", "gi", bf.implementation, "Go to implementation", bfnr)
	M.map("n", "gr", bf.references, "Go to references", bfnr)
	M.map("n", "K", bf.hover, "Show documentation", bfnr)
	M.map("n", "grn", bf.rename, "Rename", bfnr)
	M.map("n", "gca", bf.code_action, "Code action", bfnr)
	M.map("n", "[d", dg.goto_prev, "Prev diagnostic", bfnr)
	M.map("n", "]d", dg.goto_next, "Next diagnostic", bfnr)
	M.map("n", "<leader>e", dg.open_float, "Show diagnostics", bfnr)
	M.map("n", "<leader>q", dg.setloclist, "Diagnostics list", bfnr)
end

M.lualine_macro = function()
	local r = vim.fn.reg_recording()
	return r ~= "" and "@" .. r or ""
end

M.telescope = function()
	local tb, path = require("telescope.builtin"), vim.fn.stdpath("config")
	tb.find_in_nvim = function()
		tb.find_files({ cwd = path })
	end

	M.map("n", "<leader>fn", tb.find_in_nvim, "Telescope find files in Neovim")
	M.map("n", "<leader>ff", tb.find_files, "Telescope find files")
	M.map("n", "<leader>fg", tb.live_grep, "Telescope live grep")
	M.map("n", "<leader>fb", tb.buffers, "Telescope buffers")
	M.map("n", "<leader>fh", tb.help_tags, "Telescope help tags")
end

M.map("v", "<space>x", "<cmd>.lua<cr>", "Execute Lua code in selection")
M.map("n", "<Esc>", "<cmd>nohlsearch<cr>", "Clear search highlight")
M.map("i", "jk", "<Esc>", "Exit insert mode")

return M
