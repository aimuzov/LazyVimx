local disabled_ft = {
	"Avante",
	"lazy",
	"mason",
	"neo-tree",
	"snacks_dashboard",
	"snacks_terminal",
}

return {
	{
		"mcauley-penney/visual-whitespace.nvim",
		desc = "Reveal whitespace characters in visual mode, similar to VSCode",
		event = "ModeChanged *:[vV\22]",

		opts = {
			highlight = { link = "VisualWhitespace", force = true },
			fileformat_chars = { unix = "↩" },
			list_chars = {
				space = "·",
				tab = "→	",
				nbsp = "␣",
			},
			ignore = {
				filetypes = disabled_ft,
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
