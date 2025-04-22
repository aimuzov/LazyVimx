return {
	"lewis6991/gitsigns.nvim",
	optional = true,

	opts = {
		numhl = true,
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "┃" },
		},
	},
}
