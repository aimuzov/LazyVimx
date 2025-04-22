local disabled_ft = {
	"alpha",
	"neo-tree",
	"neotest-summary",
	"aerial",
	"noice",
	"chatgpt-input",
	"neo-tree-preview",
}

return {
	"lewis6991/satellite.nvim",
	desc = "Displays decorated scrollbars only in the current window",

	opts = {
		current_only = true,
		zindex = 30,
		handlers = { diagnostic = { enable = false } },
		excluded_filetypes = disabled_ft,
	},
}
