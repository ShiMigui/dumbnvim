return {
	"hrsh7th/nvim-cmp",
	dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	opts = {
		sources = { { name = "nvim_lsp" }, { name = "path" }, { name = "buffer" }, { name = "luasnip" } },
		experimental = { ghost_text = true },
		snippet = { expand = function(a) require("luasnip").lsp_expand(a.body) end },
	},
	config = function(_, opts)
		local c = require("cmp")
		local m = c.mapping
		opts.mapping = m.preset.insert({ ["<CR>"] = m.confirm({ select = true }) })
		c.setup(opts)
	end,
}
