local OptionsUtil = require("lazyvimenhanced.config.options.util")

local options = {
	autochdir = false,
	swapfile = false,
	backup = true,
	backupdir = vim.fn.getenv("HOME") .. "/.local/state/nvim/backup/",
	smoothscroll = true,
	conceallevel = 2,

	expandtab = false,
	smarttab = true,
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,
	autoindent = true,

	pumblend = 15,
	winblend = 5,

	timeout = true,
	timeoutlen = 350,
	ttimeoutlen = 0,

	showmode = false,

	showbreak = "↪",
	listchars = { eol = " ", space = "·", tab = "→ " },
	fillchars = { diff = " ", eob = " " },

	spelllang = "",
}

if LazyVim.has("langmapper.nvim") then
	options.langmap = OptionsUtil.langmap_create()
end

OptionsUtil.options_apply(options)
OptionsUtil.mouse_context_menu_fix()