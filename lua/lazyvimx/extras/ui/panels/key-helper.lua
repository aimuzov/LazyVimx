return {
	{
		"folke/which-key.nvim",
		opts = {
			plugins = { spelling = false },
			icons = { group = " " },
			layout = { spacing = 5 },
			window = { winblend = 15 },
			disable = {
				buftypes = { "lazyterm", "terminal" },
				filetypes = { "neo-tree" },
			},
		},
	},

	{
		"folke/which-key.nvim",

		opts = function(_, opts)
			if opts.triggers_blacklist ~= nil then
				return
			end

			local whichkey_blacklisted = require("lazyvimx.util.keys").whichkey_blacklisted

			opts.triggers_blacklist = {
				o = whichkey_blacklisted,
				i = whichkey_blacklisted,
				n = whichkey_blacklisted,
				v = whichkey_blacklisted,
			}
		end,
	},
}
