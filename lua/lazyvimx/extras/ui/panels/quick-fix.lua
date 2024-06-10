return {
	{
		"nvim-telescope/telescope.nvim",
		opts = function(_, opts)
			local actions = require("telescope.actions")
			local mappings = {
				["<C-q>"] = actions.send_to_qflist,
				["<M-q>"] = actions.send_selected_to_qflist,
			}

			opts.defaults.mappings = {
				i = mappings,
				n = mappings,
			}
		end,
	},

	{
		"folke/trouble.nvim",
		opts = function()
			vim.api.nvim_create_autocmd("QuickFixCmdPost", {
				callback = function()
					vim.cmd([[Trouble qflist open]])
				end,
			})
		end,
	},
}
