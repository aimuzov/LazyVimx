function insert_extras()
	table.insert(require("lazyvim.util.extras").sources, {
		name = "[ 󰬟 ]",
		desc = "Some recipes (extras) for enhance lazyvim",
		module = "lazyvimx.extras",
	})
end

function set_colorscheme(_, opts)
	opts.colorscheme = require("lazyvimx.util.colorscheme").get_name()
end

function set_global()
	vim.g.lazyvim_check_order = false
	vim.g.xtras_prios = {}
end

return {
	{ "aimuzov/LazyVimx", config = true },
	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	{ "LazyVim/LazyVim", opts = set_global },
	{ "LazyVim/LazyVim", opts = insert_extras },
	{ "LazyVim/LazyVim", opts = set_colorscheme },
}
