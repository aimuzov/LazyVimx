local diagnostic_is_enabled = true

return {
	{
		"folke/zen-mode.nvim",

		opts = {
			window = { width = 1 },

			plugins = {
				gitsigns = { enabled = true },
				kitty = { enabled = false },
				options = { enabled = true, laststatus = 0 },
				twilight = { enabled = false },
				wezterm = { enabled = true, font = "+2" },
			},

			on_open = function()
				diagnostic_is_enabled = vim.diagnostic.is_enabled()

				vim.keymap.set("n", "q", "<cmd>close<cr>", { silent = true })
				vim.diagnostic.enable(false)

				if vim.fn.exists(":SatelliteDisable") > 0 then
					vim.cmd("SatelliteDisable")
				end
			end,

			on_close = function()
				vim.keymap.del("n", "q", { silent = true })

				if diagnostic_is_enabled then
					vim.diagnostic.enable()
				end

				if vim.fn.exists(":SatelliteDisable") > 0 then
					vim.cmd("SatelliteDisable")
				end
			end,
		},
	},

	{
		"folke/zen-mode.nvim",
		opts = function()
			local disabled_ft = { "neo-tree", "snacks_terminal" }
			local toggle_orig = require("zen-mode").toggle

			require("zen-mode").toggle = function(...)
				if not vim.tbl_contains(disabled_ft, vim.bo.filetype) then
					toggle_orig(...)
				end
			end
		end,
	},
}
