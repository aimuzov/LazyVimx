return {
	{
		"saecki/live-rename.nvim",
		opts = {
			keys = {
				submit = { { "n", "<cr>" }, { "v", "<cr>" }, { "i", "<cr>" } },
				cancel = { { "n", "<c-c>" }, { "v", "<c-c>" }, { "i", "<c-c>" } },
			},
		},
	},

	{
		"saecki/live-rename.nvim",
		dependencies = { "LazyVim/LazyVim" },

		opts = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()

			keys[#keys + 1] = {
				"<leader>cr",
				require("live-rename").rename,
				desc = "Rename",
				has = "rename",
			}
		end,
	},
}
