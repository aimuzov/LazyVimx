return {
	"harrisoncramer/gitlab.nvim",

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
		attachment_dir = vim.fn.getenv("HOME") .. "/temp/screenshots",
		discussion_tree = {
			auto_open = false,
			position = "bottom",
		},

		merge = {
			squash = true,
		},
	},
}
