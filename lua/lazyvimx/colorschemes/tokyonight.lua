local blend = require("lazyvimx.util.color").blend

local override_highlights = function(hl, c)
	hl.AlphaFooter = { fg = c.fg, style = {} }
	hl.AlphaHeader1 = { fg = c.fg }
	hl.AlphaHeader2 = { fg = blend(c.bg, c.fg, 50) }
	hl.AlphaHeader3 = { fg = blend(c.bg, c.fg, 50) }
	hl.AlphaHeader4 = { fg = blend(c.bg, c.fg, 50) }
	hl.AlphaHeader5 = { fg = blend(c.bg, c.fg, 50) }
	hl.AlphaHeader6 = { fg = blend(c.bg, c.fg, 50) }
	hl.AlphaHeader7 = { fg = blend(c.bg, c.fg, 50) }
	hl.AlphaHeader8 = { fg = c.fg }
	hl.AlphaShortcut = { bg = c.bg, fg = blend(c.bg, c.fg, 20) }
	hl.AlphaShortcutBorder = { fg = blend(c.bg, c.fg, 20) }
	hl.BufferLineFill = { bg = c.bg_dark }
	hl.EdgyTitle = { bg = c.bg_dark, fg = c.bg_dark }
	hl.IblIndent = { fg = blend(c.bg, c.fg, 5) }
	hl.IblScope = { fg = blend(c.bg, c.fg, 15) }
	hl.NeoTreeFloatBorder = { link = "FloatBorder" }
	hl.NeoTreeFloatNormal = { link = "NormalFloat" }
	hl.NeoTreeFloatTitle = { link = "FloatTitle" }
	hl.NeoTreeTabActive = { fg = c.fg, bg = blend(c.bg, c.fg, 10) }
	hl.NeoTreeTabInactive = { fg = c.fg, bg = c.bg }
	hl.NeoTreeTabSeparatorActive = { bg = blend(c.bg, c.fg, 10), fg = c.bg }
	hl.NeoTreeTabSeparatorInactive = { bg = c.bg, fg = c.bg }
	hl.NeoTreeWinSeparator = { bg = c.bg, fg = c.bg }
	hl.TreesitterContext = { bg = c.bg, blend = 10 }
	hl.TreesitterContextBottom = { fg = blend(c.bg, c.fg, 15), blend = 0, underline = true }
	hl.TreesitterContextLineNumber = { bg = c.bg }
	hl.VisualWhitespace = { link = "Visual" }
end

return {
	{
		"folke/tokyonight.nvim",
		opts = {
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				floats = "normal",
			},
			sidebars = { "neo-tree" },

			on_highlights = override_highlights,
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "folke/tokyonight.nvim" },
		optional = true,

		opts = {
			options = { theme = "tokyonight" },
		},
	},

	{
		"catppuccin/nvim",
		enabled = false,
	},
}
