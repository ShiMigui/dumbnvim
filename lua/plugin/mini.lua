return {
	"echasnovski/mini.nvim",
	lazy = false,
	version = "*",
	keys = { { "<C-b>", "<Esc><cmd>lua MiniFiles.open()<cr>", mode = "n", desc = "Open Mini Files" } },
	config = function()
		require("mini.basics").setup()
		require("mini.comment").setup()
		require("mini.pairs").setup()
		require("mini.move").setup()
		require("mini.align").setup()
		require("mini.files").setup()
		require("mini.git").setup()
	end,
}
