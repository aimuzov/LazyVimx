return {
	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = function(_, opts)
			require("lspconfig.server_configurations.stylelint_lsp").default_config.filetypes = {}
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = { ensure_installed = { "stylelint" } },
	},
}
