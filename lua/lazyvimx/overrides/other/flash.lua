return {
	"folke/flash.nvim",
	optional = true,

	opts = {
		modes = { search = { enabled = false } },

		prompt = {
			prefix = {
				{ "  ", "FlashPromptIcon" },
				{ " ", "FlashPromptSep" },
			},
		},
	},
}
