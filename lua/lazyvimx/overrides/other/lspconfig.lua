return {
	"neovim/nvim-lspconfig",
	optional = true,

	opts = {
		inlay_hints = { enabled = false },

		diagnostics = {
			underline = false,
			virtual_text = {
				spacing = 0,
				prefix = "▎",
				suffix = " ",
			},
		},
	},
}
