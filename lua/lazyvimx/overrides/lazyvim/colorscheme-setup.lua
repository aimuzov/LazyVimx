return {
	"LazyVim/LazyVim",

	opts = function(_, opts)
		opts.colorscheme = require("lazyvimx.util.colorscheme").get_name()
	end,
}
