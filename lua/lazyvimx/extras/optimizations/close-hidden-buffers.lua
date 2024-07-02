return {
	"LazyVim/LazyVim",
	opts = function()
		local buf_delete = LazyVim.has("mini.bufremove") and require("mini.bufremove").delete or vim.api.nvim_buf_delete

		vim.api.nvim_create_autocmd("BufHidden", {
			desc = "Delete [No Name] buffers",
			callback = function(data)
				if data.file == "" and vim.bo[data.buf].buftype == "" and not vim.bo[data.buf].modified then
					vim.schedule(function()
						pcall(buf_delete, data.buf)
					end)
				end
			end,
		})
	end,
}
