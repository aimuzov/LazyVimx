return {
	"LazyVim/LazyVim",
	import = "lazyvim.plugins",
	opts = function(_, opts)
		table.insert(require("lazyvim.util.extras").sources, {
			name = "󰬟",
			desc = "Some recipes (extras) for enhance lazyvim",
			module = "lazyvimx.extras",
		})

		opts.colorscheme = require("lazyvimx.util.colorscheme").get_name()
	end,
}
