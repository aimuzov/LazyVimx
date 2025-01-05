return {
	"aaronik/treewalker.nvim",
	opts = {
		highlight = true,
		highlight_duration = 250,
		highlight_group = "TreewalkerIlluminate",
	},
	keys = {
		{ "<c-a-l>", [[<cmd>Treewalker Right<cr>]] },
		{ "<c-a-h>", [[<cmd>Treewalker Left<cr>]] },
		{ "<c-a-j>", [[<cmd>Treewalker Down<cr>]] },
		{ "<c-a-k>", [[<cmd>Treewalker Up<cr>]] },
		{ "<c-a-.>", [[<cmd>Treewalker SwapDown<cr>]] },
		{ "<c-a-,>", [[<cmd>Treewalker SwapUp<cr>]] },
	},
}
