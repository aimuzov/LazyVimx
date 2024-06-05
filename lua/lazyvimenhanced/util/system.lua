local M = {}

function M.theme_is_dark()
	local cmd_handle = io.popen("defaults read -g AppleInterfaceStyle 2>&1", "r")
	local cmd_result_raw = cmd_handle ~= nil and cmd_handle:read("*a")
	local cmd_result_safety = cmd_result_raw:gsub("[\n\r]", "")
	local theme_is_dark = cmd_result_safety == "Dark"

	if cmd_handle ~= nil then
		cmd_handle:close()
	end

	return theme_is_dark
end

return M
