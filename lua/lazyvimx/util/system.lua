local M = {}

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

return M
