local disabled_ft = {
	"alpha",
	"chatgpt-input",
	"lazy",
	"snacks_terminal",
	"neo-tree",
	"neo-tree-popup",
	"trouble",
}

return {
	"tummetott/reticle.nvim",
	desc = "Cursorline follow the active window",
	event = "VeryLazy",

	opts = {
		disable_in_insert = false,
		always_highlight_number = true,
		ignore = { cursorline = disabled_ft },
	},
}
