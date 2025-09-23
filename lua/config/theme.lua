local M = {}

M.colors = {
	fg = "#FFFFFF",
	bg = "#000000",
	primary = "#FF5555",
	secondary = "#50FA7B",
	tertiary = "#BD93F9",
}
local c = M.colors

M.lualine = {
	normal = {
		a = { bg = c.primary, fg = c.bg },
		b = { bg = c.secondary, fg = c.bg },
		c = { bg = c.bg, fg = c.tertiary },
		x = { bg = c.bg, fg = c.tertiary },
		y = { bg = c.secondary, fg = c.bg },
		z = { bg = c.primary, fg = c.bg },
	},
}

M.set_hl = function()
	vim.api.nvim_set_hl(0, "Normal", { fg = c.fg, bg = c.bg })
	vim.api.nvim_set_hl(0, "NormalFloat", { fg = c.fg, bg = c.bg })
end

return M
