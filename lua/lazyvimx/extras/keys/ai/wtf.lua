return {
	"piersolenski/wtf.nvim",
	optional = true,

	keys = {
		{
			"<leader>cD",
			[[<cmd>lua require("wtf").ai()<cr>]],
			desc = "Debug diagnostic with AI",
			mode = { "n", "x" },
		},
		{
			"<leader>cg",
			[[<cmd>lua require("wtf").search()<cr>]],
			desc = "Search diagnostic with Google",
			mode = { "n" },
		},
	},
}
