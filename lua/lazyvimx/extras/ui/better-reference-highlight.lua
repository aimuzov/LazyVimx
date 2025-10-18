return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		optional = true,

		opts = function(_, opts)
			---@type CtpHighlightOverrideFn
			local replace_reference_hl = function(c)
				return {
					LspReferenceRead = { bg = c.none, fg = c.rosewater, style = { "bold" } },
					LspReferenceText = { bg = c.none, fg = c.rosewater, style = { "bold" } },
					LspReferenceWrite = { bg = c.none, fg = c.rosewater, style = { "bold" } },
				}
			end

			opts.highlight_overrides = opts.highlight_overrides or {}

			if opts.highlight_overrides.all ~= nil then
				local hl_all_orig = opts.highlight_overrides.all
				local hl_all_extend = function(c)
					local a = hl_all_orig(c)
					local b = replace_reference_hl(c)

					for k, v in pairs(b) do
						a[k] = v
					end

					return a
				end

				opts.highlight_overrides.all = hl_all_extend
			else
				opts.highlight_overrides.all = replace_reference_hl
			end
		end,
	},

	{
		"folke/tokyonight.nvim",
		optional = true,

		opts = function(_, opts)
			local blend = require("lazyvimx.util.general").color_blend

			local replace_reference_hl = function(hl, c)
				hl.LspReferenceRead = { bg = "none", fg = blend(c.fg, c.magenta2, 50), bold = true }
				hl.LspReferenceText = { bg = "none", fg = blend(c.fg, c.magenta2, 50), bold = true }
				hl.LspReferenceWrite = { bg = "none", fg = blend(c.fg, c.magenta2, 50), bold = true, underline = true }
			end

			if opts.on_highlights ~= nil then
				local on_hl_orig = opts.on_highlights
				local on_hl_extend = function(hl, c)
					on_hl_orig(hl, c)
					replace_reference_hl(hl, c)
				end

				opts.on_highlights = on_hl_extend
			else
				opts.on_highlights = replace_reference_hl
			end
		end,
	},
}
