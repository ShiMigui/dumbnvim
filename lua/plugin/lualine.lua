return function(theme, macro)
	return {
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				theme = theme,
				icons_enabled = true,
				component_separators = { left = "", right = "" }, --  
				section_separators = { left = "", right = "" }, --  
				disabled_filetypes = { statusline = {}, winbar = {} },
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					events = { "WinEnter", "BufEnter", "BufWritePost", "SessionLoadPost", "FileChangedShellPost", "VimResized", "Filetype", "CursorMoved", "CursorMovedI", "ModeChanged", "RecordingEnter", "RecordingLeave" },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 2 } },
				lualine_x = { macro }, -- "encoding", "fileformat", "filetype"
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			-- inactive_sections = { lualine_a = {}, lualine_b = {}, lualine_c = {}, lualine_x = {}, lualine_y = {}, lualine_z = {} },
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	}
end
