local diagnostic_is_enabled = true

return {
	"folke/zen-mode.nvim",

	opts = {
		window = {
			backdrop = 0.95,
			width = 120,
			height = 1,
			options = {
				list = false,
				number = false,
				relativenumber = false,
				wrap = true,
			},
		},

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

			if vim.fn.exists(":IBLDisable") > 0 then
				vim.cmd("IBLDisable")
			end

			if vim.fn.exists(":SatelliteDisable") > 0 then
				vim.cmd("SatelliteDisable")
			end
		end,

		on_close = function()
			vim.keymap.del("n", "q", { silent = true })

			if diagnostic_is_enabled then
				vim.diagnostic.enable()
			end

			if vim.fn.exists(":IBLEnable") > 0 then
				vim.cmd("IBLEnable")
			end

			if vim.fn.exists(":SatelliteDisable") > 0 then
				vim.cmd("SatelliteDisable")
			end
		end,
	},
}
