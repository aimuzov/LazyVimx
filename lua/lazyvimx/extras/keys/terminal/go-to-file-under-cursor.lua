local function open_path(buf, path)
	if vim.fn.filereadable(path) == 1 then
		local cursor = vim.api.nvim_win_get_cursor(0)
		local line = vim.api.nvim_buf_get_lines(buf, cursor[1] - 1, cursor[1], false)[1]

		vim.cmd("vs " .. path)

		local row_col = string.match(line, path .. "%s(%d+:%d+)")

		if row_col then
			row_col = vim.iter(vim.split(row_col, ":")):map(tonumber):totable()
			vim.api.nvim_win_set_cursor(0, row_col)
		end

		return
	end

	local ok, msg = pcall(vim.ui.open, path)

	if not ok then
		vim.notify(msg, vim.log.levels.ERROR)
	end
end

return {
	"LazyVim/LazyVim",
	opts = function()
		vim.api.nvim_create_autocmd("TermOpen", {
			desc = "Open paths from terminal",
			callback = function(event)
				vim.keymap.set({ "n" }, "gx", function()
					local path = vim.fn.expand("<cfile>")

					if path ~= "" then
						open_path(event.buf, path)
					end
				end, { buffer = event.buf })
			end,
		})
	end,
}
