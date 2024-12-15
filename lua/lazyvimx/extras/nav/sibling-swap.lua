return {
	"Wansmer/sibling-swap.nvim",
	dependencies = { "nvim-treesitter" },
	opts = {
		highlight_node_at_cursor = { hl_opts = { link = "Search" } },
		use_default_keymaps = false,
	},
	keys = {
		{ "<C-.>", [[<cmd>lua require("sibling-swap").swap_with_right()<cr>]] },
		{ "<C-,>", [[<cmd>lua require("sibling-swap").swap_with_left()<cr>]] },
	},
}
