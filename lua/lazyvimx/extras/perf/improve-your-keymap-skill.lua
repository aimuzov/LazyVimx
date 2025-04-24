return {
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },

		opts = {
			enabled = false,
			disabled_filetypes = { "neo-tree", "lazy", "mason", "alpha" },
		},
	},
}
