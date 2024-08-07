local M = {}

function M.get_household()
	local config = require("lazyvimx").config

	for household_name, household_value in pairs(config.colorscheme.households) do
		if LazyVim.has(household_name) then
			return household_value
		end
	end
end

function M.get_name()
	local is_dark = require("lazyvimx.util.system").theme_is_dark()
	local colorscheme_household = M.get_household()

	return is_dark and colorscheme_household[1] or colorscheme_household[2]
end

return M
