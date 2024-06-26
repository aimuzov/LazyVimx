return {
	"LazyVim/LazyVim",
	opts = function()
		vim.api.nvim_create_autocmd("TermOpen", {
			desc = "Start insert on open",
			command = "startinsert",
		})
	end,
}
