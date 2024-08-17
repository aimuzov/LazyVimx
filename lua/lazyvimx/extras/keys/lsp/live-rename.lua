return {
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
}
