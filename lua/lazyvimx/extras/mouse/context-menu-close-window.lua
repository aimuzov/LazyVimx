return {
	"LazyVim/LazyVim",
	opts = function()
		vim.cmd.amenu({ "PopUp.Close <cmd>:close<cr>" })
	end,
}
