return {
	{
		"brenton-leighton/multiple-cursors.nvim",
		dependencies = { "hrsh7th/nvim-cmp" },

		opts = {
			pre_hook = function()
				vim.opt.cursorline = false
				vim.g.minipairs_disable = true

				vim.cmd("NoMatchParen")

				require("cmp").setup({ enabled = false })
			end,

			post_hook = function()
				vim.opt.cursorline = true
				vim.g.minipairs_disable = false

				vim.cmd("DoMatchParen")

				require("cmp").setup({ enabled = true })
			end,
		},
	},

	{
		"folke/which-key.nvim",
		optional = true,
		opts = function()
			require("which-key.plugins.presets").operators["v"] = nil
		end,
	},

	{
		"gbprod/stay-in-place.nvim",
		optional = true,

		dependencies = {
			"brenton-leighton/multiple-cursors.nvim",
			opts = {
				custom_key_maps = {
				-- stylua: ignore start
				{ "n", { ">>", "<Tab>" },  function() require("stay-in-place").shift_right_line() end, },
				{ "n", "<<",               function() require("stay-in-place").shift_left_line() end, },
				{ { "n", "i" }, "<S-Tab>", function() require("stay-in-place").shift_left_line() end, },
					-- stylua: ignore end
				},
			},
		},
	},

	{
		"chrisgrieser/nvim-spider",
		optional = true,
		dependencies = {
			"brenton-leighton/multiple-cursors.nvim",
			opts = {
				custom_key_maps = {
					{
						{ "n", "x" },
						"w",
						function(_, count)
							if count ~= 0 and vim.api.nvim_get_mode().mode == "n" then
								vim.cmd("normal! " .. count)
							end
							require("spider").motion("w")
						end,
					},

					{
						{ "n", "x" },
						"e",
						function(_, count)
							if count ~= 0 and vim.api.nvim_get_mode().mode == "n" then
								vim.cmd("normal! " .. count)
							end
							require("spider").motion("e")
						end,
					},

					{
						{ "n", "x" },
						"b",
						function(_, count)
							if count ~= 0 and vim.api.nvim_get_mode().mode == "n" then
								vim.cmd("normal! " .. count)
							end
							require("spider").motion("b")
						end,
					},
				},
			},
		},
	},
}
