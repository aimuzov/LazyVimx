return {
	"m00qek/baleia.nvim",
	desc = "Render ANSI escape sequences with proper colors in buffers and DAP REPL output",

	config = function(_, opts)
		local baleia = require("baleia").setup(opts)

		vim.api.nvim_create_user_command("BaleiaLogs", baleia.logger.show, { bang = true })

		vim.api.nvim_create_user_command("BaleiaColorize", function()
			baleia.once(vim.api.nvim_get_current_buf())
		end, { bang = true })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "dap-repl",
			callback = function()
				baleia.automatically(vim.api.nvim_get_current_buf())
			end,
		})
	end,
}
