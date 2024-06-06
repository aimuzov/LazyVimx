local M = {}

function M.get_household()
	if LazyVim.has("catppuccin") then
		return { "catppuccin-frappe", "catppuccin-latte" }
	elseif LazyVim.has("tokyonight") then
		return { "tokyonight-storm", "tokyonight-day" }
	end
end

function M.get_name()
	local is_dark = require("lazyvimx.util.system").theme_is_dark()
	local colorscheme_household = M.get_household()

	return is_dark and colorscheme_household[1] or colorscheme_household[2]
end

return M
