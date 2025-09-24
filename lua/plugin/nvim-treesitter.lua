return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	opts = {
    indent = { enable = true },
		auto_install = true,
		highlight = {
			disable = function(_, buffer)
				local buf_name = vim.api.nvim_buf_get_name(buffer)
				if buf_name == "" or vim.bo[buffer].buftype ~= "" then return true end
				local ok, stats = pcall(vim.loop.fs_stat, buf_name)
				return ok and stats and stats.size > 5242880 -- 5MB
			end,
		},
	},
}
