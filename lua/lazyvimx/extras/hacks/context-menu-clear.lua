return {
	"LazyVim/LazyVim",
	opts = function()
		vim.cmd.aunmenu({ "PopUp.How-to\\ disable\\ mouse" })
		vim.cmd.aunmenu({ "PopUp.-1-" })
	end,
}
