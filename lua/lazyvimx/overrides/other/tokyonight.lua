local blend = require("lazyvimx.util.general").color_blend

local override_highlights = function(hl, c)
	hl.AlphaFooter = { fg = c.fg }
	hl.AlphaHeader1 = { fg = c.fg_dark }
	hl.AlphaHeader2 = { fg = blend(c.bg, c.blue0, 50) }
	hl.AlphaHeader3 = { fg = blend(c.bg, c.blue1, 50) }
	hl.AlphaHeader4 = { fg = blend(c.bg, c.blue2, 50) }
	hl.AlphaHeader5 = { fg = blend(c.bg, c.blue5, 50) }
	hl.AlphaHeader6 = { fg = blend(c.bg, c.blue1, 50) }
	hl.AlphaHeader7 = { fg = blend(c.bg, c.blue0, 50) }
	hl.AlphaHeader8 = { fg = c.fg_dark }
	hl.AlphaShortcut = { bg = c.bg, fg = blend(c.bg, c.fg, 40) }
	hl.AlphaShortcutBorder = { fg = blend(c.bg, c.fg, 40) }
	hl.BufferLineCustomGroupLabel = { bg = c.bg_dark1, fg = c.fg }
	hl.BufferLineCustomGroupSep = { bg = c.bg_dark1, fg = c.blue }
	hl.BufferLineFill = { bg = c.bg_dark1 }
	hl.BufferLineIndicatorSelected = { bg = c.bg, fg = c.blue }
	hl.BufferLineTruncMarker = { bg = c.bg_dark1, fg = blend(c.bg, c.fg, 50) }
	hl.EdgyTitle = { bg = c.bg_dark, fg = c.bg_dark }
	hl.NeoTreeFloatBorder = { link = "FloatBorder" }
	hl.NeoTreeFloatNormal = { link = "NormalFloat" }
	hl.NeoTreeFloatTitle = { link = "FloatTitle" }
	hl.NeoTreeNormal = { bg = c.bg_dark1 }
	hl.NeoTreeNormalNC = { bg = c.bg_dark1 }
	hl.NeoTreeTabActive = { fg = c.fg, bg = blend(c.bg, c.fg, 10) }
	hl.NeoTreeTabInactive = { fg = c.fg, bg = c.bg }
	hl.NeoTreeTabSeparatorActive = { bg = blend(c.bg, c.fg, 10), fg = c.bg }
	hl.NeoTreeTabSeparatorInactive = { bg = c.bg, fg = c.bg }
	hl.NeoTreeWinSeparator = { bg = c.bg, fg = c.bg }
	hl.SnacksIndent = { fg = blend(c.bg, c.fg, 5) }
	hl.SnacksIndentScope = { fg = blend(c.bg, c.fg, 15) }
	hl.TreesitterContext = { bg = c.bg, blend = 10 }
	hl.TreesitterContextBottom = { fg = blend(c.bg, c.fg, 15), blend = 0, underline = true }
	hl.TreesitterContextLineNumber = { bg = c.bg }
	hl.TroubleNormal = { bg = c.bg }
	hl.TroubleNormalNC = { bg = c.bg }
	hl.VisualWhitespace = { link = "Visual" }
end

return {
	{
		"folke/tokyonight.nvim",
		optional = true,

		opts = {
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				floats = "normal",
			},

			on_highlights = override_highlights,
			cache = false,
		},

		specs = {
			{
				"nvim-lualine/lualine.nvim",
				dependencies = { { "folke/tokyonight.nvim", optional = true } },
				optional = true,

				opts = function(_, opts)
					if vim.g.colors_name:find("tokyonight", 1, true) then
						opts.options.theme = vim.g.colors_name
					end

					vim.api.nvim_create_autocmd("ColorScheme", {
						desc = "Setup lualine theme after colorscheme changed",
						pattern = "tokyonight*",
						callback = vim.schedule_wrap(function(data)
							require("lualine").setup({ options = { theme = data.match } })
						end),
					})
				end,
			},
		},
	},
}
