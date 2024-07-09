local M = {}

function M.rename()
	local tab_name = vim.fn.input("tab name: ")

	if tab_name == "" then
		return
	end

	vim.cmd("BufferLineTabRename " .. tab_name)
end

return M
