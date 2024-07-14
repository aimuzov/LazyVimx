return {
	"folke/which-key.nvim",

	dependencies = {
		"Wansmer/langmapper.nvim",
		optional = true,
		opts = function()
			local getcharstr_orig = vim.fn.getcharstr

			vim.fn.getcharstr = function(expr)
				local char = getcharstr_orig(expr)
				local char_translated = require("langmapper.utils").translate_keycode(char, "default", "ru")

				return char_translated
			end
		end,
	},
}
