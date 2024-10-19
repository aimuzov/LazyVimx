return {
	{ import = "lazyvim.plugins.extras.test.core" },

	{
		"nvim-neotest/neotest",
		opts = { discovery = { enabled = false } },
	},

	{
		"nvim-neotest/neotest",
		dependencies = { "haydenmeade/neotest-jest" },

		opts = function(_, opts)
			table.insert(
				opts.adapters,
				require("neotest-jest")({
					-- stylua: ignore
					cwd = function() return vim.fn.getcwd() end,
					jest_test_discovery = true,
					env = { CI = true },
				})
			)
		end,
	},
}
