return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	dependencies = {
		"neovim/nvim-lspconfig",
		opts = { diagnostics = { virtual_text = false } },
	},

	opts = {
		preset = "simple",
		options = { virt_texts = { priority = 5000 } },
	},
}
