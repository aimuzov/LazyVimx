local function colorscheme_update()
	vim.cmd.colorscheme(LazyVimEnhanced.colorscheme_get_name())
end

return {
	"LazyVim/LazyVim",

	opts = function()
		vim.api.nvim_create_autocmd("Signal", {
			desc = "Change colorscheme after system theme changed",
			callback = vim.schedule_wrap(colorscheme_update),
		})
	end,
}
