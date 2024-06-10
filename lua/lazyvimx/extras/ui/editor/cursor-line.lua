return {
	"tummetott/reticle.nvim",
	event = "VeryLazy",
	opts = {
		disable_in_insert = false,
		always_highlight_number = true,
		ignore = {
			cursorline = {
				"chatgpt-input",
				"lazy",
				"lazyterm",
				"neo-tree",
				"neo-tree-popup",
				"TelescopePrompt",
				"trouble",
			},
		},
	},
}
