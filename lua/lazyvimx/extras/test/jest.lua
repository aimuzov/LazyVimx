return {
	{ import = "lazyvim.plugins.extras.test.core" },
	{
		"nvim-neotest/neotest",
		dependencies = { "haydenmeade/neotest-jest" },

		opts = function(_, opts)
			table.insert(
				opts.adapters,
				require("neotest-jest")({
					cwd = function()
						return vim.fn.getcwd()
					end,
				})
			)
		end,
	},
}
