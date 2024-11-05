local blend = require("lazyvimx.util.color").blend

local colors_get = function(flavor)
	return require("catppuccin.palettes").get_palette(flavor)
end

local override_all = function(c)
	return {
		AerialLine = { fg = "none", bg = c.crust },
		AlphaFooter = { fg = c.surface1, style = {} },
		AlphaHeader1 = { fg = c.surface2 },
		AlphaHeader2 = { fg = blend(c.base, c.blue, 5) },
		AlphaHeader3 = { fg = blend(c.base, c.sky, 5) },
		AlphaHeader4 = { fg = blend(c.base, c.green, 5) },
		AlphaHeader5 = { fg = blend(c.base, c.yellow, 5) },
		AlphaHeader6 = { fg = blend(c.base, c.peach, 5) },
		AlphaHeader7 = { fg = blend(c.base, c.red, 5) },
		AlphaHeader8 = { fg = c.surface2 },
		AlphaShortcut = { bg = blend(c.base, c.crust, 50), fg = blend(c.base, c.surface1, 50) },
		AlphaShortcutBorder = { fg = blend(c.base, c.surface1, 50) },
		BufferLineCustomGroupLabel = { bg = c.mantle, fg = c.text, style = { "bold" } },
		BufferLineCustomGroupSep = { bg = c.mantle, fg = c.maroon },
		ChatGPTQuestion = { fg = c.mauve },
		ChatGPTTotalTokens = { bg = "none", fg = c.overlay2 },
		ChatGPTTotalTokensBorder = { fg = c.text },
		CmpDocFloat = { bg = c.mantle, blend = 15 },
		DiffviewDiffAdd = { bg = blend(c.green, c.base, 93) },
		DiffviewDiffDelete = { bg = blend(c.red, c.base, 93) },
		DiffviewNormal = { bg = c.mantle },
		DiffviewWinSeparator = { link = "NeoTreeWinSeparator" },
		EdgyNormal = { link = "NormalFloat" },
		EdgyTitle = { bg = c.mantle, fg = c.mantle },
		FlashBackdrop = { fg = blend(c.base, c.blue, 35) },
		FlashPrompt = { bg = c.crust },
		FlashPromptSep = { fg = blend(c.crust, c.text, 50) },
		FloatBorder = { bg = c.base },
		FloatTitle = { fg = c.lavender, style = { "bold" } },
		Folded = { bg = blend(c.base, c.crust, 20), fg = c.surface2 },
		GitConflictCurrent = { bg = blend(c.blue, c.base, 90) },
		GitConflictCurrentLabel = { bg = blend(c.blue, c.base, 85) },
		GitConflictIncoming = { bg = blend(c.green, c.base, 90) },
		GitConflictIncomingLabel = { bg = blend(c.green, c.base, 85) },
		GitSignsAdd = { fg = blend(c.green, c.base, 50) },
		GitSignsAddInline = { bg = blend(c.green, c.base, 83) },
		GitSignsAddPreview = { bg = blend(c.green, c.base, 93) },
		GitSignsChange = { fg = blend(c.yellow, c.base, 50) },
		GitSignsDelete = { fg = blend(c.red, c.base, 50) },
		GitSignsDeleteInline = { bg = blend(c.red, c.base, 83) },
		GitSignsDeletePreview = { bg = blend(c.red, c.base, 93) },
		GitSignsStagedAdd = { fg = blend(c.green, c.base, 50 - 10) },
		GitSignsStagedAddNr = { link = "GitSignsStagedAdd" },
		GitSignsStagedChange = { fg = blend(c.yellow, c.base, 50 - 10) },
		GitSignsStagedChangeNr = { link = "GitSignsStagedChange" },
		GitSignsStagedDelete = { fg = blend(c.red, c.base, 50 - 10) },
		GitSignsStagedDeleteNr = { link = "GitSignsStagedDelete" },
		GlanceBorderTop = { bg = c.base, fg = blend(c.base, c.lavender, 30) },
		GlanceFoldIcon = { link = "FoldColumn" },
		GlanceListBorderBottom = { link = "GlanceBorderTop" },
		GlanceListNormal = { bg = blend(c.base, c.crust, 15), fg = c.subtext0 },
		GlancePreviewBorderBottom = { link = "GlanceBorderTop" },
		GlancePreviewNormal = { bg = blend(c.base, c.crust, 30) },
		GlanceWinBarFilename = { link = "GlanceWinBarTitle" },
		GlanceWinBarFilepath = { link = "GlanceWinBarTitle" },
		GlanceWinBarTitle = { fg = c.overlay0, bg = blend(c.base, c.crust, 50), style = { "bold" } },
		IblIndent = { fg = blend(c.base, c.text, 5) },
		IblScope = { fg = blend(c.base, c.text, 15) },
		LazyReasonKeys = { fg = c.overlay0 },
		LspInlayHint = { bg = "none" },
		LineNr = { fg = c.surface2 },
		MiniIconsAzure = { fg = blend(c.sapphire, c.mantle, 25) },
		MiniIconsBlue = { fg = blend(c.blue, c.mantle, 25) },
		MiniIconsCyan = { fg = blend(c.teal, c.mantle, 25) },
		MiniIconsGreen = { fg = blend(c.green, c.mantle, 25) },
		MiniIconsGrey = { fg = blend(c.text, c.mantle, 25) },
		MiniIconsOrange = { fg = blend(c.peach, c.mantle, 25) },
		MiniIconsPurple = { fg = blend(c.mauve, c.mantle, 25) },
		MiniIconsRed = { fg = blend(c.red, c.mantle, 25) },
		MiniIconsYellow = { fg = blend(c.yellow, c.mantle, 25) },
		NeoTreeCursorLine = { bg = c.crust },
		NeoTreeDotfile = { fg = c.overlay0 },
		NeoTreeFadeText1 = { fg = c.surface1 },
		NeoTreeFadeText2 = { fg = c.surface2 },
		NeoTreeFileStats = { fg = c.surface1 },
		NeoTreeFileStatsHeader = { fg = c.surface2 },
		NeoTreeFloatBorder = { bg = c.mantle },
		NeoTreeFloatNormal = { bg = c.mantle },
		NeoTreeFloatTitle = { bg = c.mantle, fg = c.lavender, style = { "bold" } },
		NeoTreeMessage = { fg = c.surface1 },
		NeoTreeModified = { fg = c.peach },
		NeoTreeRootName = { fg = c.green },
		NeoTreeTabActive = { fg = c.text, bg = blend(c.base, c.text, 10) },
		NeoTreeTabSeparatorActive = { bg = c.base, fg = c.base },
		NeoTreeWinSeparator = { bg = c.base, fg = c.base },
		NoiceCmdline = { bg = c.mantle },
		NoiceCmdlinePopupBorder = { link = "FloatBorder" },
		NoiceFormatEvent = { fg = c.overlay1 },
		NoiceFormatKind = { fg = c.overlay0 },
		NoiceLspProgressTitle = { fg = c.overlay0 },
		NoicePopup = { link = "NormalFloat" },
		NoicePopupmenuSelected = { link = "Visual" },
		NoiceScrollbar = { link = "NormalFloat" },
		NoiceScrollbarThumb = { bg = blend(c.base, c.surface0, 50) },
		NormalFloat = { bg = c.base },
		NotifyBackground = { bg = c.base },
		NotifyDEBUGBorder = { fg = blend(c.base, c.peach, 30) },
		NotifyERRORBorder = { fg = blend(c.base, c.red, 30) },
		NotifyINFOBorder = { fg = blend(c.base, c.blue, 30) },
		NotifyTRACEBorder = { fg = blend(c.base, c.rosewater, 30) },
		NotifyWARNBorder = { fg = blend(c.base, c.yellow, 30) },
		Pmenu = { bg = blend(c.crust, c.base, 50), blend = 15 },
		PmenuSbar = { bg = blend(c.crust, c.surface2, 30) },
		PmenuSel = { bg = blend(c.crust, c.surface2, 50) },
		PmenuThumb = { bg = blend(c.crust, c.surface2, 40) },
		StatusLine = { bg = blend(c.base, c.mantle, 50) },
		SymbolUsageImpl = { fg = c.yellow },
		SymbolUsageDef = { fg = c.red },
		SymbolUsageRef = { fg = c.blue },
		TinyInlineDiagnosticVirtualTextError = { fg = c.red },
		TinyInlineDiagnosticVirtualTextWarn = { fg = c.yellow },
		TinyInlineDiagnosticVirtualTextInfo = { fg = c.sky },
		TinyInlineDiagnosticVirtualTextHint = { fg = c.teal },
		TinyInlineDiagnosticVirtualTextArrow = { link = "CursorLine" },
		TinyInlineInvDiagnosticVirtualTextError = { link = "CursorLine" },
		TinyInlineInvDiagnosticVirtualTextWarn = { link = "CursorLine" },
		TinyInlineInvDiagnosticVirtualTextInfo = { link = "CursorLine" },
		TinyInlineInvDiagnosticVirtualTextHint = { link = "CursorLine" },
		TelescopeResultsDiffAdd = { link = "NeoTreeGitAdded" },
		TelescopeResultsDiffChange = { link = "NeoTreeGitModified" },
		TelescopeResultsDiffDelete = { link = "NeoTreeGitDeleted" },
		TelescopeResultsDiffUntracked = { link = "NeoTreeGitUntracked" },
		TelescopeSelection = { link = "Visual" },
		TelescopeTitle = { link = "FloatTitle" },
		TreesitterContext = { bg = c.base, blend = 10 },
		TreesitterContextBottom = { fg = c.surface2, blend = 0 },
		TreesitterContextLineNumber = { link = "LineNr" },
		TroubleCount = { bg = "none" },
		TroubleIndent = { fg = blend(c.base, c.text, 15) },
		TroubleNormal = { link = "NormalFloat" },
		Visual = { style = {} },
		WhichKey = { bg = blend(c.base, c.mantle, 60) },
		WhichKeyNormal = { bg = blend(c.base, c.mantle, 60) },
		Whitespace = { fg = c.base },
		WinSeparator = { fg = blend(c.base, c.crust, 40) },
		ZenBg = { bg = c.mantle },
	}
end

local override_dark = function(c)
	return {
		AerialGuide = { fg = c.surface0 },
		FloatBorder = { fg = blend(c.base, c.lavender, 50) },
		GitSignsCurrentLineBlame = { fg = c.surface2 },
		IlluminatedWordRead = { bg = blend(c.base, c.surface2, 25) },
		IlluminatedWordText = { bg = blend(c.base, c.sapphire, 25) },
		IlluminatedWordWrite = { bg = blend(c.base, c.sapphire, 25) },
		NeoTreeFloatBorder = { fg = blend(c.base, c.lavender, 50) },
		NeoTreeIndentMarker = { fg = c.base },
		SatelliteBar = { bg = c.surface0, blend = 15 },
		SymbolUsageContent = { fg = c.surface2 },
		TinyInlineDiagnosticVirtualTextError = { bg = blend(c.base, c.red, 20) },
		TinyInlineDiagnosticVirtualTextWarn = { bg = blend(c.base, c.yellow, 20) },
		TinyInlineDiagnosticVirtualTextInfo = { bg = blend(c.base, c.sky, 20) },
		TinyInlineDiagnosticVirtualTextHint = { bg = blend(c.base, c.teal, 20) },
		Visual = { bg = blend(c.base, c.surface2, 30), style = {} },
		VisualWhitespace = { bg = blend(c.base, c.surface2, 30), fg = c.surface2 },
	}
end

local override_light = function(c)
	return {
		AerialGuide = { fg = c.crust },
		FloatBorder = { fg = blend(c.base, c.text, 20) },
		GitSignsCurrentLineBlame = { fg = c.surface0 },
		IlluminatedWordRead = { bg = blend(c.base, c.surface2, 20) },
		IlluminatedWordText = { bg = blend(c.base, c.sapphire, 10) },
		IlluminatedWordWrite = { bg = blend(c.base, c.sapphire, 10) },
		NeoTreeFloatBorder = { fg = blend(c.base, c.text, 20) },
		NeoTreeIndentMarker = { fg = c.surface0 },
		SatelliteBar = { bg = c.crust, blend = 15 },
		SymbolUsageContent = { fg = c.surface0 },
		TinyInlineDiagnosticVirtualTextError = { bg = blend(c.base, c.red, 10) },
		TinyInlineDiagnosticVirtualTextWarn = { bg = blend(c.base, c.yellow, 10) },
		TinyInlineDiagnosticVirtualTextInfo = { bg = blend(c.base, c.sky, 10) },
		TinyInlineDiagnosticVirtualTextHint = { bg = blend(c.base, c.teal, 10) },
		Visual = { bg = blend(c.base, c.crust, 85) },
		VisualWhitespace = { bg = blend(c.base, c.crust, 85), fg = c.surface2 },
	}
end

local override_bufferline_hls = function(c)
	local hls = {
		fill = { bg = c.mantle },
		modified = { bg = c.mantle },
		pick = { bg = c.mantle },
		trunc_marker = { bg = c.mantle },
		duplicate_visible = { bg = c.base },

		buffer_visible = { fg = c.subtext0 },
		modified_visible = { fg = c.peach },
		separator = { fg = c.menlo },
		tab_selected = { fg = c.text, style = { "bold" } },
		tab_separator = { bg = c.mantle, fg = c.mantle },
		tab_separator_selected = { bg = c.base, fg = c.base },
	}

	-- stylua: ignore start
	local items = {
		"buffer", "close_button", "diagnostic", "error", "error_diagnostic",
		"hint", "indicator", "info", "info_diagnostic", "modified",
		"numbers", "pick", "warning", "warning_diagnostic",
	}
	-- stylua: ignore end

	for _, item in ipairs(items) do
		local key_selected = item .. "_selected"
		local key_visible = item .. "_visible"

		if hls[key_selected] == nil then
			hls[key_selected] = {}
		end

		if hls[key_visible] == nil then
			hls[key_visible] = {}
		end

		hls[key_selected].bg = c.base
		hls[key_visible].bg = c.base
	end

	return hls
end

local lualine_theme_create = function(c)
	local colors = {
		["normal"] = c.blue,
		["insert"] = c.green,
		["visual"] = c.mauve,
		["replace"] = c.red,
		["command"] = c.peach,
		["terminal"] = c.green,
		["inactive"] = c.mantle,
	}

	local theme = {}

	for mode, color in pairs(colors) do
		theme[mode] = {
			a = { bg = blend(c.mantle, color, 70), fg = c.mantle },
			b = { bg = blend(c.mantle, color, 15), fg = color },
			c = { bg = blend(c.base, c.mantle, 50), fg = mode == "inactive" and c.surface2 or c.text },
			x = { bg = blend(c.base, c.mantle, 50), fg = c.surface2 },
		}
	end

	return theme
end

local alpha_header_animate = function()
	local c = colors_get()
	local colors = { c.blue, c.sky, c.green, c.yellow, c.peach, c.red }
	local limit = require("lazyvimx.util.system").theme_is_dark() and 100 or 20

	for i = 5, limit do
		vim.schedule(function()
			local timer = vim.loop.new_timer()

			if timer ~= nil then
				timer:start(
					i * 30,
					0,
					vim.schedule_wrap(function()
						for j = 2, 7 do
							vim.api.nvim_set_hl(0, "AlphaHeader" .. j, { fg = blend(c.base, colors[j - 1], i) })
						end
					end)
				)
			end
		end)
	end
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",

		opts = {
			integrations = {
				navic = false,
				treesitter_context = true,
				dap = { enabled = true, enable_ui = true },
			},

			highlight_overrides = {
				all = override_all,
				frappe = override_dark,
				macchiato = override_dark,
				mocha = override_dark,
				latte = override_light,
			},
		},
	},

	{
		"akinsho/bufferline.nvim",
		dependencies = { { "catppuccin/nvim", name = "catppuccin" } },
		optional = true,

		opts = function(_, opts)
			local catppuccin_bufferline = require("catppuccin.groups.integrations.bufferline")

			opts.highlights = catppuccin_bufferline.get({
				styles = { "bold" },
				custom = {
					frappe = override_bufferline_hls(colors_get("frappe")),
					macchiato = override_bufferline_hls(colors_get("macchiato")),
					mocha = override_bufferline_hls(colors_get("mocha")),
					latte = override_bufferline_hls(colors_get("latte")),
				},
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { { "catppuccin/nvim", name = "catppuccin" } },
		optional = true,

		opts = function(_, opts)
			opts.options.theme = lualine_theme_create(colors_get())

			vim.api.nvim_create_autocmd("ColorScheme", {
				desc = "Setup lualine theme after colorscheme changed",
				callback = vim.schedule_wrap(function()
					require("lualine").setup({
						options = { theme = lualine_theme_create(colors_get()) },
					})
				end),
			})
		end,
	},

	{
		"goolord/alpha-nvim",
		dependencies = { { "catppuccin/nvim", name = "catppuccin" } },
		optional = true,

		init = function()
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "AlphaReady",
				callback = alpha_header_animate,
			})
		end,
	},

	{
		"folke/tokyonight.nvim",
		enabled = false,
	},
}
