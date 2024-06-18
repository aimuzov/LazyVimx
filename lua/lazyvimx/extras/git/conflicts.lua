return {
	"akinsho/git-conflict.nvim",

	opts = function(_, opts)
		opts.disable_diagnostics = true

		vim.api.nvim_create_autocmd("User", {
			pattern = "GitConflictDetected",
			callback = function()
				vim.notify("Conflict detected in '" .. vim.fn.expand("%:.") .. "'")
			end,
		})
	end,
}
