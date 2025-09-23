local M = {}

local c = {
	fg = "#FFFFFF",
	bg = "#000000",
	primary = "#FF5555",
	secondary = "#50FA7B",
	tertiary = "#BD93F9",
}

M.cfg = { fg = c.fg, bg = c.bg }

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

local hl = vim.api.nvim_set_hl
M.set_hl = function()
	hl(0, "Normal", M.cfg)
	hl(0, "NormalFloat", M.cfg)
end

return M
