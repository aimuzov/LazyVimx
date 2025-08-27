local disabled_ft = { "snacks_dashboard" }

return {
	"lukas-reineke/virt-column.nvim",
	desc = "Display a character as the colorcolumn",
	event = "VimEnter",

	opts = {
		char = "│",
		highlight = "SnacksIndent",
		exclude = { filetypes = disabled_ft },
	},

	init = function()
		vim.opt.ruler = false

		if next(vim.opt.colorcolumn:get()) == nil then
			vim.opt.colorcolumn:append("120")
		end
	end,
}
