local M = {}

local function dec2hex(n_value)
	if type(n_value) == "string" then
		n_value = tonumber(n_value)
	end

	local n_hex_val = string.format("%X", n_value)
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

	return "#" .. dec2hex(r3) .. dec2hex(g3) .. dec2hex(b3)
end

function M.popen_get_result(cmd)
	local cmd_handle = io.popen(cmd, "r")
	local cmd_result = cmd_handle ~= nil and cmd_handle:read("*a"):gsub("%s+$", ""):gsub("[\n\r]", "") or ""

	if cmd_handle ~= nil then
		cmd_handle:close()
	end

	return cmd_result
end

function M.theme_is_dark()
	local cmd_result = M.popen_get_result("defaults read -g AppleInterfaceStyle 2>&1")
	local theme_is_dark = cmd_result == "Dark"

	return theme_is_dark
end

function M.get_dotfiles_path()
	local dotfiles_path = vim.fn.getenv("DOTFILES_SRC_PATH")
	return dotfiles_path ~= vim.NIL and dotfiles_path or ""
end

function M.get_flavor(colorscheme)
	local config = require("lazyvimx").config
	local flavor_index = require("lazyvimx.util.general").theme_is_dark() and 1 or 2
	local flavor_list = config.colorscheme_flavors[colorscheme or config.colorscheme]
	local flavor_name = flavor_list[flavor_index]

	return flavor_name
end

function M.has_extra(extra)
	local Config = require("lazyvim.config")
	local modname = "lazyvimx.extras." .. extra

	return vim.tbl_contains(require("lazy.core.config").spec.modules, modname)
		or vim.tbl_contains(Config.json.data.extras, modname)
end

function M.warn_missing_extra(extra_name)
	return function()
		if not LazyVim.has_extra(extra_name) and not M.has_extra(extra_name) then
			Snacks.notify.warn("Missing extra: `" .. extra_name .. "`", { icon = "󰏗" })
		end
	end
end

return M
