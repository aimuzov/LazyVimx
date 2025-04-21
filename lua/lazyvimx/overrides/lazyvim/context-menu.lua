return {
	"LazyVim/LazyVim",
	opts = function()
		vim.cmd.aunmenu({ "PopUp.How-to\\ disable\\ mouse" })
		vim.cmd.aunmenu({ "PopUp.-1-" })

		vim.cmd.amenu({ "PopUp.Close <cmd>:close<cr>" })
	end,
}
