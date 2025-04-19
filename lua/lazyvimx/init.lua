local M = {}

local defaults = {
	colorscheme = {
		households = {
			catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
			tokyonight = { "tokyonight-storm", "tokyonight-day" },
		},
	},

	vimopts = {
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
		timeoutlen = 500,
		ttimeoutlen = 0,

		showmode = false,

		showbreak = "↪",
		listchars = { eol = " ", space = " ", tab = "  " },
		fillchars = { diff = " ", eob = " " },

		spelllang = "",
		shell = vim.fn.getenv("SHELL"),
	},
}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", defaults, opts or {})

	for opt_name, opt_value in pairs(M.config.vimopts) do
		local ok, _ = pcall(vim.api.nvim_get_option_info2, opt_name, {})
		if ok then
			vim.opt[opt_name] = opt_value
		else
			vim.notify("Option " .. opt_name .. " is not supported", vim.log.levels.WARN)
		end
	end
end

return M
