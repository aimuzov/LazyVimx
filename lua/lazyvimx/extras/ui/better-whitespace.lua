return {
	{
		"mcauley-penney/visual-whitespace.nvim",
		desc = "Reveal whitespace characters in visual mode, similar to VSCode",
		event = "ModeChanged *:[vV\22]",

		opts = {
			highlight = { link = "VisualWhitespace" },
			fileformat_chars = { unix = "↩" },
			list_chars = {
				space = "·",
				tab = "→	",
				nbsp = "␣",
			},
			ignore = {
				filetypes = {
					"neo-tree",
					"mason",
					"lazy",
					"snacks_terminal",
				},
			},
		},
	},

	{
		"mcauley-penney/visual-whitespace.nvim",
		opts = function(_, opts)
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = vim.schedule_wrap(function()
					require("visual-whitespace").setup(opts)
				end),
			})
		end,
	},
}
