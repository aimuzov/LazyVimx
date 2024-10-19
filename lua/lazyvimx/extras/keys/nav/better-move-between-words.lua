return {
	"chrisgrieser/nvim-spider",
	optional = true,
	keys = {
		{ "cw", "c<cmd>lua require('spider').motion('e')<cr>", mode = { "n" } },
		{ "w", "<cmd>lua require('spider').motion('w')<cr>", mode = { "n", "o", "x" } },
		{ "e", "<cmd>lua require('spider').motion('e')<cr>", mode = { "n", "o", "x" } },
		{ "b", "<cmd>lua require('spider').motion('b')<cr>", mode = { "n", "o", "x" } },
		{ "<c-f>", "<esc>l<cmd>lua require('spider').motion('w')<cr>i", mode = { "i" } },
		{ "<c-b>", "<esc><cmd>lua require('spider').motion('b')<cr>i", mode = { "i" } },
	},
}
