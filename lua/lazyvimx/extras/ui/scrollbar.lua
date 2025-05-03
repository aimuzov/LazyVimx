local disabled_ft = {
	"aerial",
	"alpha",
	"chatgpt-input",
	"neo-tree",
	"neo-tree-preview",
	"neotest-summary",
	"noice",
	"snacks_terminal",
}

return {
	"dstein64/nvim-scrollview",
	desc = "Displays decorated scrollbars only in the current window",

	opts = {
		current_only = true,
		excluded_filetypes = disabled_ft,
		signs_hidden_for_insert = true,
		signs_overflow = "right",
		zindex = 30,
	},
}
