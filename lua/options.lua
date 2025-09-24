local M = {}

M.setup = function()
	local keymaps, colors = require("config.keymap"), require("config.theme")
	require("lazy").setup({
		spec = {
			"nvim-tree/nvim-web-devicons",
			{ "williamboman/mason.nvim", opts = {} }, -- Necessary be running before than mason-lspconfig and mason-conform.
			require("plugin.nvim-treesitter"),
			require("plugin.telescope")(keymaps.telescope),
			require("plugin.mason-conform"),
			require("plugin.nvim-cmp"),
			require("plugin.mason-lspconfig")(keymaps.on_attach_lsp),
			require("plugin.mini"),
			require("plugin.lualine")(colors.lualine, keymaps.lualine_macro),
			require("plugin.nvim-colorizer"),
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
			},
		},
		-- checker = { enabled = true },
	})
	vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, { callback = colors.set_hl })
end

M.lazy_clone = function()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.uv.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"--branch=stable",
			"https://github.com/folke/lazy.nvim.git",
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
end

return M
