return {
	"olrtg/nvim-emmet",
	optional = true,

	keys = {
		{
			"<leader>xe",
			[[<cmd>lua require("nvim-emmet").wrap_with_abbreviation()<cr>]],
			desc = "Wrap with emmet abbreviation",
			mode = { "n", "v" },
		},
	},
}
