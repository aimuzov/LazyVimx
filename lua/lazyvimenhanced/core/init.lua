return {
	"LazyVim/LazyVim",
	import = "lazyvim.plugins",
	opts = function(_, opts)
		table.insert(require("lazyvim.util.extras").sources, {
			name = "Enhanced",
			desc = "Some recipes (extras) for enhance lazyvim",
			module = "lazyvimenhanced.extras",
		})

		opts.colorscheme = require("lazyvimenhanced.util.colorscheme").get_name()
	end,
}
