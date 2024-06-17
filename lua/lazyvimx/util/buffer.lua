local M = {}

function M.delete(buffer_number, force)
	if buffer_number == nil then
		return
	end

	local bufdelete = require("mini.bufremove").delete
	local buffer_modified = vim.api.nvim_get_option_value("modified", { buf = buffer_number })

	if force or not buffer_modified then
		bufdelete(buffer_number, force)
		return
	end

	local buf_name = vim.api.nvim_buf_get_name(buffer_number)
	local message = buf_name == "" and "Save changes" or ("Save changes to %q?"):format(buf_name)
	local choice = vim.fn.confirm(message, "&Yep\n&Nop")

	if choice == 1 then -- Yes
		vim.cmd.write()
		bufdelete(buffer_number)
	elseif choice == 2 then -- No
		bufdelete(buffer_number, true)
	end
end

return M
