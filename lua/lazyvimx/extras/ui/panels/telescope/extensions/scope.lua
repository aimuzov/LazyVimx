return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "tiagovla/scope.nvim" },
	optional = true,

	keys = {
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers (per tab)" },
		{ "<leader>fB", "<cmd>Telescope scope buffers theme=dropdown previewer=false<cr>", desc = "Buffers (all)" },
	},
}
