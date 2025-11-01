return {
	"folke/sidekick.nvim",
	optional = true,

	specs = {
		{
			"saghen/blink.cmp",
			optional = true,

			---@type blink.cmp.Config
			opts = {
				keymap = {
					["<Tab>"] = {
						"snippet_forward",
						function()
							return require("sidekick").nes_jump_or_apply()
						end,
						"fallback",
					},
				},
			},
		},
	},
}
