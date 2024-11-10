return {
	"tummetott/reticle.nvim",
	event = "VeryLazy",
	opts = {
		disable_in_insert = false,
		always_highlight_number = true,
		ignore = {
			cursorline = {
				"alpha",
				"chatgpt-input",
				"lazy",
				"snacks_terminal",
				"neo-tree",
				"neo-tree-popup",
				"TelescopePrompt",
				"trouble",
			},
		},
	},
}
