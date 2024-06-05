return {
	"LazyVim/LazyVim",

	dependencies = {
		{
			"folke/which-key.nvim",
			opts = { defaults = { ["<leader>l"] = { name = "+lazy" } } },
		},
	},

	keys = {
		{ "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" } },
		{ "<leader>lx", "<cmd>LazyExtras<cr>", { desc = "Lazy extras" } },
	},
}
