return {
	{
		"aaronhallaert/advanced-git-search.nvim",
		cmd = { "AdvancedGitSearch" },

		dependencies = {
			"tpope/vim-fugitive",
			"tpope/vim-rhubarb",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},

		keys = { { "<leader>ga", "<cmd>AdvancedGitSearch<cr>", "Open git actions" } },
	},

	{
		"nvim-telescope/telescope.nvim",
		optional = true,

		opts = {
			extensions = {
				advanced_git_search = {
					diff_plugin = "diffview",
					telescope_theme = { show_custom_functions = "dropdown" },
				},
			},
		},
	},
}
