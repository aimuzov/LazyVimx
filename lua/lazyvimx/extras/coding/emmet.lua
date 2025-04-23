return {
	{
		"neovim/nvim-lspconfig",
		opts = { servers = { emmet_language_server = {} } },
	},

	{
		"olrtg/nvim-emmet",
		init = function()
			vim.cmd("command! EmmetWrap lua require('nvim-emmet').wrap_with_abbreviation()")
		end,
	},
}
