return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		auto_update = true,
		integrations = {
			["mason-null-ls"] = false,
			["mason-nvim-dap"] = false,
		},
	},
}
