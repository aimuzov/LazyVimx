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

return {
	"aimuzov/LazyVimx",

	opts = function()
		for opt_name, opt_value in pairs(options) do
			local ok, _ = pcall(vim.api.nvim_get_option_info2, opt_name, {})
			if ok then
				if opt_name == "fillchars" then
					vim.opt[opt_name]:append(opt_value)
				else
					vim.opt[opt_name] = opt_value
				end
			else
				vim.notify("Option " .. opt_name .. " is not supported", vim.log.levels.WARN)
			end
		end
	end,
}
