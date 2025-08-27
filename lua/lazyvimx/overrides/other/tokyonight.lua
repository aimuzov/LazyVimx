local blend = require("lazyvimx.util.general").color_blend

local override_highlights = function(hl, c)
	hl.BufferLineCustomGroupLabel = { bg = c.bg_dark1, fg = c.fg }
	hl.BufferLineCustomGroupSep = { bg = c.bg_dark1, fg = c.blue }
	hl.BufferLineFill = { bg = c.bg_dark1 }
	hl.BufferLineIndicatorSelected = { bg = c.bg, fg = c.blue }
	hl.BufferLineTruncMarker = { bg = c.bg_dark1, fg = blend(c.bg, c.fg, 50) }
	hl.EdgyTitle = { bg = c.bg_dark, fg = c.bg_dark }
	hl.FloatBorder = { fg = blend(c.bg, c.blue2, 50) }
	hl.FloatTitle = { fg = blend(c.bg, c.blue2, 50) }
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
	hl.ScrollView = { bg = blend(c.bg, c.fg, 10), blend = 15 }
	hl.SnacksDashboardBorder = { fg = blend(c.bg, c.fg_gutter, 50) }
	hl.SnacksDashboardDesc = { fg = c.fg }
	hl.SnacksDashboardFooter = { fg = c.fg_dark }
	hl.SnacksDashboardHeader1 = { fg = c.fg_dark }
	hl.SnacksDashboardHeader2 = { fg = blend(c.bg, c.blue0, 50) }
	hl.SnacksDashboardHeader3 = { fg = blend(c.bg, c.blue1, 50) }
	hl.SnacksDashboardHeader4 = { fg = blend(c.bg, c.blue2, 50) }
	hl.SnacksDashboardHeader5 = { fg = blend(c.bg, c.blue5, 50) }
	hl.SnacksDashboardHeader6 = { fg = blend(c.bg, c.blue1, 50) }
	hl.SnacksDashboardHeader7 = { fg = blend(c.bg, c.blue0, 50) }
	hl.SnacksDashboardHeader8 = { fg = c.fg_dark }
	hl.SnacksDashboardIcon = { fg = c.yellow }
	hl.SnacksDashboardKey = { bg = blend(c.bg, c.bg, 50), fg = blend(c.bg, c.fg_gutter, 50) }
	hl.SnacksDashboardSpecial = { fg = blend(c.bg, c.magenta, 50) }
	hl.SnacksIndent = { fg = blend(c.bg, c.fg, 5) }
	hl.SnacksIndentScope = { fg = blend(c.bg, c.fg, 15) }
	hl.SnacksPickerBoxTitle = { link = "FloatBorder" }
	hl.SnacksPickerInputBorder = { fg = blend(c.bg, c.blue2, 25) }
	hl.SnacksPickerInputCursorLine = { bg = c.bg }
	hl.TreesitterContext = { bg = c.bg, blend = 10 }
	hl.TreesitterContextBottom = { fg = blend(c.bg, c.fg, 15), blend = 0, underline = true }
	hl.TreesitterContextLineNumber = { bg = c.bg }
	hl.TroubleNormal = { bg = c.bg }
	hl.TroubleNormalNC = { bg = c.bg }
	hl.Visual = { bg = blend(c.bg, c.blue, 10) }
	hl.VisualWhitespace = { link = "Visual" }
	hl.WhichKeyBorder = { link = "FloatBorder" }
	hl.WinSeparator = { fg = blend(c.bg, c.bg_dark, 60) }
end

local lualine_theme_create = function(c)
	local colors = {
		["normal"] = c.blue,
		["insert"] = c.green,
		["visual"] = c.magenta,
		["replace"] = c.red,
		["command"] = c.yellow,
		["terminal"] = c.green1,
		["inactive"] = c.bg_statusline,
	}

	local theme = {}

	for mode, color in pairs(colors) do
		theme[mode] = {
			a = { bg = blend(c.bg_dark, color, 70), fg = c.bg_dark },
			b = { bg = blend(c.bg_dark, color, 15), fg = color },
			c = { bg = blend(c.bg, c.bg_dark, 50), fg = mode == "inactive" and c.fg_dark or c.fg },
			x = { bg = blend(c.bg, c.bg_dark, 50), fg = c.fg_dark },
		}
	end

	return theme
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
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { { "folke/tokyonight.nvim", optional = true } },
		optional = true,

		opts = function(_, opts)
			if vim.g.colors_name:find("tokyonight", 1, true) then
				local colors = require("tokyonight.colors").setup()
				opts.options.theme = lualine_theme_create(colors)
			end

			vim.api.nvim_create_autocmd("ColorScheme", {
				desc = "Setup lualine theme after colorscheme changed",
				pattern = "tokyonight*",
				callback = vim.schedule_wrap(function(data)
					local style = data.match:sub(12)
					local colors = require("tokyonight.colors").setup({
						style = style ~= "" and style or "moon",
						on_colors = function() end,
						on_highlights = override_highlights,
					})

					require("lualine").setup({
						winbar = opts.winbar,
						inactive_winbar = opts.inactive_winbar,
						options = { theme = lualine_theme_create(colors) },
					})
				end),
			})
		end,
	},
}
