return {
	{ "aimuzov/LazyVimx", config = true },

	{
		"LazyVim/LazyVim",
		import = "lazyvim.plugins",

		opts = function(_, opts)
			vim.g.lazyvim_check_order = false

			table.insert(require("lazyvim.util.extras").sources, {
				name = "󰬟",
				desc = "Some recipes (extras) for enhance lazyvim",
				module = "lazyvimx.extras",
			})

			opts.colorscheme = require("lazyvimx.util.colorscheme").get_name()
		end,
	},
}
