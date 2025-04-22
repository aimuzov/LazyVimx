return {
	desc = "Display one line diagnostic messages where the cursor is, with icons and colors",

	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",

		opts = {
			preset = "custom",
			options = { virt_texts = { priority = 5000 } },
		},
	},

	{
		"rachartier/tiny-inline-diagnostic.nvim",

		opts = function(_, opts)
			opts.preset = "custom"

			local build_orig = require("tiny-inline-diagnostic.presets").build

			require("tiny-inline-diagnostic.presets").build = function(name, transparent_bg)
				local preset = build_orig(name == "custom" and "classic" or name, transparent_bg)

				if name == "custom" then
					preset.signs = vim.tbl_extend("force", preset.signs, {
						up_arrow = "   ",
						arrow = " ",
						left = "",
						vertical_end = " ╰",
					})
				end

				return preset
			end
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = { diagnostics = { virtual_text = false } },
	},
}
