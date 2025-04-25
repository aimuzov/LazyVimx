return {
	"LazyVim/LazyVim",

	opts = function()
		vim.o.autochdir = false
		vim.o.swapfile = false
		vim.o.backup = true
		vim.o.backupdir = vim.fn.getenv("HOME") .. "/.local/state/nvim/backup/"
		vim.o.smoothscroll = true
		vim.o.conceallevel = 2

		vim.o.expandtab = false
		vim.o.smarttab = true
		vim.o.shiftwidth = 4
		vim.o.tabstop = 4
		vim.o.softtabstop = 4
		vim.o.autoindent = true

		vim.o.pumblend = 15
		vim.o.winblend = 5

		vim.o.timeout = true
		vim.o.timeoutlen = 500
		vim.o.ttimeoutlen = 0
		vim.o.showmode = false

		vim.o.showbreak = "↪"
		vim.opt.listchars = { eol = " ", space = " ", tab = "  " }
		vim.opt.fillchars:append({ diff = " ", eob = " " })

		vim.o.spelllang = ""
		vim.o.shell = vim.fn.getenv("SHELL")
	end,
}
