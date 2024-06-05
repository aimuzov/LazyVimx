return {
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = true,
	},

	{
		"arsham/listish.nvim",
		dependencies = {
			"arsham/arshlib.nvim",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},

		opts = {
			quickfix = {
				open = "<leader>Qo",
				on_cursor = "<leader>Qq",
				add_note = "<leader>Qn",
				clear = "<leader>Qd",
				close = "<leader>Qc",
			},
			loclist = {
				open = "<leader>Wo",
				on_cursor = "<leader>Ww",
				add_note = "<leader>Wn",
				clear = "<leader>Wd",
				close = "<leader>Wc",
			},
		},
	},
}
