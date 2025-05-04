if not vim.g.vscode then
	return {}
end

return {
	{
		"LazyVim/LazyVim",
		opts = function()
			vim.api.nvim_create_autocmd("ModeChanged", {
				pattern = "*",
				callback = function()
					local mode = vim.api.nvim_get_mode().mode
					if mode == "i" then
						require("vscode").action("neovim-ui-indicator.insert")
					elseif mode == "v" then
						require("vscode").action("neovim-ui-indicator.visual")
					elseif mode == "n" then
						require("vscode").action("neovim-ui-indicator.normal")
					end
				end,
			})
		end,

		keys = {
			{ "<leader>l", "<nop>" },
			{ "<leader>qq", "<nop>" },
		},
	},

	{
		"folke/snacks.nvim",
		opts = function()
			Snacks.terminal = LazyVim.terminal
		end,
	},
}
