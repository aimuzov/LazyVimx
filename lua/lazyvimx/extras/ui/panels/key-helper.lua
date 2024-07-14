return {
	{
		"folke/which-key.nvim",
		opts = {
			layout = { spacing = 5 },
			plugins = { spelling = { enabled = false } },
			win = { wo = { winblend = 15 } },
			disable = {
				bt = { "lazyterm", "terminal" },
				ft = { "neo-tree" },
			},
		},
	},
}
