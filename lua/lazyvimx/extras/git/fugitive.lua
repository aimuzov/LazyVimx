return {
	desc = "Fugitive is the plugin for Git. Supports gitlab & github",

	{
		"tpope/vim-rhubarb",
		dependencies = { "tpope/vim-fugitive" },
	},

	{
		"shumphrey/fugitive-gitlab.vim",
		dependencies = { "tpope/vim-fugitive" },

		init = function()
			vim.g.gitlab_api_keys = { ["gitlab.com"] = vim.fn.getenv("GITLAB_TOKEN") }
		end,
	},
}
