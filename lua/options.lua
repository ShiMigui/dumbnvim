vim.diagnostic.config({ signs = true, underline = true, virtual_text = true, update_in_insert = true })

local o = vim.o
o.number = true
o.relativenumber = true
o.termguicolors = true
o.cursorline = true
o.scrolloff = 5
o.splitright = true
o.splitbelow = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.ignorecase = true
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

require("lazy").setup({
	spec = {
		"nvim-tree/nvim-web-devicons",
		{ "williamboman/mason.nvim", opts = {} },
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			lazy = false,
			opts = {
				auto_install = true,
				highlight = {
					disable = function(_, buffer)
						local buf_name = vim.api.nvim_buf_get_name(buffer)
						if buf_name == "" or vim.bo[buffer].buftype ~= "" then
							return true
						end

						local ok, stats = pcall(vim.loop.fs_stat, buf_name)
						return ok and stats and stats.size > 5242880 -- 5MB
					end,
				},
				indent = { enable = true },
			},
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config=Release && cmake --install build",
			config = vim.fn.telescope_keymaps,
		},
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = "nvim-lua/plenary.nvim",
			opts = { extensions = { fzf = {} }, pickers = { find_files = { theme = "ivy" } } },
			config = function(_, opts)
				local t = require("telescope")
				t.setup(opts)
				t.load_extension("fzf")
			end,
		},
		{
			"stevearc/conform.nvim",
			opts = { formatters_by_ft = { lua = { "stylua" } } },
			config = function(_, opts)
				require("conform").setup(opts)
				vim.keymap.set("n", "<leader>f", require("conform").format, { desc = "Formatar arquivo" })
			end,
		},
		{ "zapling/mason-conform.nvim", opts = {} },
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
			},
			opts = {
				sources = { { name = "nvim_lsp" }, { name = "path" }, { name = "buffer" }, { name = "luasnip" } },
				experimental = { ghost_text = true },
				snippet = {
					expand = function(a)
						require("luasnip").lsp_expand(a.body)
					end,
				},
			},
			config = function(_, opts)
				local c = require("cmp")
				local m = c.mapping

				-- opts.mapping = m.preset.insert({ ["<CR>"] = m.confirm({ select = true }) })

				c.setup(opts)
			end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = "neovim/nvim-lspconfig",
			config = function(_, _)
				local lsps = require("mason-lspconfig").get_installed_servers()
				local args = {
					on_attach = vim.fn.on_attach_lsp,
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				}
				vim.lsp.enable(lsps)
				for _, lsp in ipairs(lsps) do
					vim.lsp.config(lsp, args)
				end
			end,
		},
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
		},
		{
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
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = "nvim-tree/nvim-web-devicons",
			opts = {
				options = {
					theme = vim.highlight.lualine,
					icons_enabled = true,
					component_separators = { left = "", right = "" }, --  
					section_separators = { left = "", right = "" }, --  
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
						refresh_time = 8,
						events = {
							"WinEnter",
							"BufEnter",
							"BufWritePost",
							"SessionLoadPost",
							"FileChangedShellPost",
							"VimResized",
							"Filetype",
							"CursorMoved",
							"CursorMovedI",
							"ModeChanged",
							"RecordingEnter",
							"RecordingLeave",
						},
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { { "filename", path = 2 } },
					lualine_x = { vim.fn.lualine_macro }, -- "encoding", "fileformat", "filetype"
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				-- inactive_sections = { lualine_a = {}, lualine_b = {}, lualine_c = {}, lualine_x = {}, lualine_y = {}, lualine_z = {} },
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			},
		},
		{
			"NvChad/nvim-colorizer.lua",
			opts = {
				user_default_options = {
					RGB = true,
					RRGGBB = true,
					names = false,
					RRGGBBAA = true,
					rgb_fn = true,
					hsl_fn = true,
					css = true,
					css_fn = true,
					mode = "background",
				},
			},
		},
	},
	-- install = { colorscheme = { "habamax" } },
	-- checker = { enabled = true },
})
