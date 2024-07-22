local M = {}

local defaults = {
	colorscheme = {
		households = {
			catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
			tokyonight = { "tokyonight-storm", "tokyonight-day" },
		},
	},
}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", defaults, opts or {})
end

return M
