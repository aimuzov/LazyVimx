return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	dependencies = {
		"neovim/nvim-lspconfig",
		opts = { diagnostics = { virtual_text = false } },
	},

	opts = {
		signs = {
			left = " ",
			right = "",
			diag = " ",
			arrow = " ",
			up_arrow = " ",
			vertical = " │",
			vertical_end = " ╰",
		},
		options = { virt_texts = { priority = 5000 } },
	},
}
