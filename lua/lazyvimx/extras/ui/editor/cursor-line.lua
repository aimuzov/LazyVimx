return {
	"tummetott/reticle.nvim",
	event = "VeryLazy",
	opts = {
		disable_in_insert = false,
		always_highlight_number = true,
		ignore = {
			cursorline = {
				"lazy",
				"neo-tree",
				"TelescopePrompt",
				"trouble",
			},
		},
	},
}
