return {
	"folke/trouble.nvim",
	opts = function()
		vim.api.nvim_create_autocmd("QuickFixCmdPost", {
			callback = function()
				vim.cmd([[Trouble qflist open]])
			end,
		})
	end,
}
