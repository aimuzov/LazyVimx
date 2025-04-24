return {
	desc = "A framework for interacting with tests within NeoVim",

	{
		"nvim-neotest/neotest",
		cond = function()
			local extra_name = "test.core"

			if not LazyVim.has_extra(extra_name) then
				require("lazyvimx.util.extra").notify_missing(extra_name, true)
				return false
			end

			return true
		end,
	},

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
