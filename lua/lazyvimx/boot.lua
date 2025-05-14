local function insert_extras()
	table.insert(require("lazyvim.util.extras").sources, {
		name = "[ 󰬟 ]",
		desc = "Some recipes (extras) for enhance lazyvim",
		module = "lazyvimx.extras",
	})
end

local function set_colorscheme(_, opts)
	opts.colorscheme = require("lazyvimx.util.general").get_flavor()
end

local function set_global()
	vim.g.lazyvim_check_order = false
	vim.g.xtras_prios = {}
	vim.g.lazyvim_explorer = "neo-tree"

	return false
end

local function update_root_lsp_ignore()
	vim.g.root_lsp_ignore = {
		unpack(vim.g.root_lsp_ignore),
		"eslint",
	}
end

return {
	{ import = "system.plug", enabled = set_global },

	{ "LazyVim/LazyVim", opts = update_root_lsp_ignore },
	{ "LazyVim/LazyVim", opts = insert_extras },
	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	{ "LazyVim/LazyVim", opts = set_colorscheme },

	{ "aimuzov/LazyVimx", dependencies = { "LazyVim/LazyVim" }, vscode = true, config = true },
}
