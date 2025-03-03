return {
	"folke/trouble.nvim",
	opts = function()
		vim.api.nvim_create_autocmd("BufWinEnter", {
			pattern = "quickfix",
			callback = function()
				local trouble = require("trouble")

				if vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0 then
					vim.defer_fn(function()
						vim.cmd.lclose()
						trouble.open("loclist")
					end, 0)
				else
					vim.defer_fn(function()
						vim.cmd.cclose()
						trouble.open("quickfix")
					end, 0)
				end
			end,
		})
	end,
}
