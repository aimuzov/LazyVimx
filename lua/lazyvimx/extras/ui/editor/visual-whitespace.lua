return {
	{
		"mcauley-penney/visual-whitespace.nvim",
		opts = {
			highlight = { link = "VisualWhitespace" },
			nl_char = "↩",
		},
	},

	{
		"mcauley-penney/visual-whitespace.nvim",
		opts = function(_, opts)
			local listchars = vim.opt.listchars:get()

			opts.space_char = listchars.space
			opts.tab_char = listchars.tab
		end,
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
