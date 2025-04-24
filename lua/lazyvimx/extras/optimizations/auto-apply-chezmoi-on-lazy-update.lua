local function chezmoi_update()
	if vim.fn.executable("chezmoi") ~= 1 then
		return
	end

	local notify_opts = { icon = "", title = "chezmoi" }
	local chezmoi_message = require("lazyvimx.util.system").popen_get_result(
		"chezmoi add ~/.config/nvim/lazy-lock.json ~/.config/nvim/lazyvim.json 2>&1"
	)

	if chezmoi_message == "" then
		Snacks.notify.info({
			"Updated:",
			"- `lazy-lock.json`",
			"- `lazyvim.json`",
		}, notify_opts)
	else
		Snacks.notify.error(chezmoi_message, notify_opts)
	end
end

return {
	"LazyVim/LazyVim",

	opts = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyUpdate",
			desc = "Update dotfiles (chezmoi apply)",
			callback = vim.schedule_wrap(chezmoi_update),
		})
	end,
}
