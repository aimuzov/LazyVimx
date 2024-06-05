local M = {}

local function color_convert_dec2hex(n_value)
	if type(n_value) == "string" then
		n_value = tonumber(n_value)
	end

	local n_hex_val = string.format("%X", n_value) -- %X returns uppercase hex, %x gives lowercase letters
	local s_hex_val = n_hex_val .. ""

	if n_value < 16 then
		return "0" .. tostring(s_hex_val)
	else
		return s_hex_val
	end
end

function M.color_blend(color_first, color_second, percentage)
	local r1, g1, b1 = string.upper(color_first):match("#([0-9A-F][0-9A-F])([0-9A-F][0-9A-F])([0-9A-F][0-9A-F])")
	local r2, g2, b2 = string.upper(color_second):match("#([0-9A-F][0-9A-F])([0-9A-F][0-9A-F])([0-9A-F][0-9A-F])")

	local r3 = tonumber(r1, 16) * (100 - percentage) / 100.0 + tonumber(r2, 16) * percentage / 100.0
	local g3 = tonumber(g1, 16) * (100 - percentage) / 100.0 + tonumber(g2, 16) * percentage / 100.0
	local b3 = tonumber(b1, 16) * (100 - percentage) / 100.0 + tonumber(b2, 16) * percentage / 100.0

	return "#" .. color_convert_dec2hex(r3) .. color_convert_dec2hex(g3) .. color_convert_dec2hex(b3)
end

function M.os_theme_is_dark()
	local cmd_handle = io.popen("defaults read -g AppleInterfaceStyle 2>&1", "r")
	local cmd_result_raw = cmd_handle ~= nil and cmd_handle:read("*a")
	local cmd_result_safety = cmd_result_raw:gsub("[\n\r]", "")
	local os_theme_is_dark = cmd_result_safety == "Dark"

	if cmd_handle ~= nil then
		cmd_handle:close()
	end

	return os_theme_is_dark
end

function M.colorscheme_get_household()
	if LazyVim.has("catppuccin") then
		return { "catppuccin-frappe", "catppuccin-latte" }
	elseif LazyVim.has("tokyonight") then
		return { "tokyonight-storm", "tokyonight-day" }
	end
end

function M.colorscheme_get_name()
	local is_dark = M.os_theme_is_dark()
	local colorscheme_household = M.colorscheme_get_household()

	return is_dark and colorscheme_household[1] or colorscheme_household[2]
end

return M