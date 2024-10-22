return {
	"LazyVim/LazyVim",
	opts = function()
		-- https://www.reddit.com/r/neovim/comments/1dt13ut/comment/lb6dkyq/
		vim.api.nvim_create_autocmd("FocusGained", {
			callback = function()
				local closedBuffers = {}

				vim.iter(vim.api.nvim_list_bufs())
					:filter(function(bufnr)
						local valid = vim.api.nvim_buf_is_valid(bufnr)
						local loaded = vim.api.nvim_buf_is_loaded(bufnr)
						return valid and loaded
					end)
					:filter(function(bufnr)
						local buf_path = vim.api.nvim_buf_get_name(bufnr)
						local does_not_exist = vim.loop.fs_stat(buf_path) == nil
						local not_special_buffer = vim.bo[bufnr].buftype == ""
						local not_new_buffer = buf_path ~= ""
						return does_not_exist and not_special_buffer and not_new_buffer
					end)
					:each(function(bufnr)
						local bufName = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
						table.insert(closedBuffers, bufName)
						vim.api.nvim_buf_delete(bufnr, { force = true })
					end)

				if #closedBuffers == 0 then
					return
				end

				if #closedBuffers == 1 then
					vim.notify("Buffer closed", closedBuffers[1])
				else
					local text = "- " .. table.concat(closedBuffers, "\n- ")
					vim.notify("Buffers closed", text)
				end
			end,
		})
	end,
}
