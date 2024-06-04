require("lazyvimenhanced.config").init()

return {
	{
		"LazyVim/LazyVim",
		import = "lazyvim.plugins",
		opts = function(_, opts)
			table.insert(require("lazyvim.util.extras").sources, {
				name = "Enhance",
				desc = "Some recipes (extras) for enhance lazyvim",
				module = "lazyvimenhanced.plugins.extras",
			})

			opts.colorscheme = LazyVimEnhanced.colorscheme_get_name()
		end,
	},
}
