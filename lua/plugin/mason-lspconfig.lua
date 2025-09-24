return function (on_attach_lsp)
  return {
			"williamboman/mason-lspconfig.nvim",
			dependencies = "neovim/nvim-lspconfig",
			config = function(_, _)
				local lsps = require("mason-lspconfig").get_installed_servers()
				local args = { on_attach = on_attach_lsp, capabilities = require("cmp_nvim_lsp").default_capabilities() }
				vim.lsp.enable(lsps)
				for _, lsp in ipairs(lsps) do vim.lsp.config(lsp, args) end
			end,
		}
end
