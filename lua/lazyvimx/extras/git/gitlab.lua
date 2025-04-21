return {
	"harrisoncramer/gitlab.nvim",
	desc = "This Neovim plugin is designed to make it easy to review Gitlab MRs from within the editor",

	dependencies = {
		{ "MunifTanjim/nui.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "sindrets/diffview.nvim" },
		{ "stevearc/dressing.nvim" },
	},

	build = function()
		require("gitlab.server").build(true)
	end,

	opts = {
		attachment_dir = vim.fn.getenv("HOME") .. "/Temp/other",
		discussion_tree = { auto_open = false, position = "bottom" },
		merge = { squash = true },
	},
}
