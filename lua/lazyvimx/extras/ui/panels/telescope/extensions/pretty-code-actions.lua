return {
	{
		"rachartier/tiny-code-action.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = { backend = "vim" },
	},

	{
		"rachartier/tiny-code-action.nvim",
		dependencies = { "LazyVim/LazyVim" },
		opts = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()

			keys[#keys + 1] = {
				"<leader>ca",
				[[<cmd>lua require("tiny-code-action").code_action()<cr>]],
				desc = "Code Action",
				mode = { "n", "v" },
				has = "codeAction",
			}
		end,
	},
}
