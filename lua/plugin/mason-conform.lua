return {
	"zapling/mason-conform.nvim",
	opts = {},
	dependencies = {
		"stevearc/conform.nvim",
		opts = { formatters_by_ft = { lua = { "stylua" } } },
		config = function(_, opts)
			require("conform").setup(opts)
			vim.keymap.set("n", "<leader>f", require("conform").format, { desc = "Formatar arquivo" })
		end,
	},
}
