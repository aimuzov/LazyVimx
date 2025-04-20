return {
	"LazyVim/LazyVim",
	import = "lazyvim.plugins",

	opts = function(_, opts)
		vim.g.lazyvim_check_order = false
	end,
}
