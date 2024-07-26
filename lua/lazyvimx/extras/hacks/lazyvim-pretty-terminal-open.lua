local function override_terminal_open()
	vim.g.lazygit_config = false

	local open_original = LazyVim.terminal.open

	LazyVim.terminal.open = function(cmd, opts)
		opts = vim.tbl_deep_extend("force", opts or {}, {
			backdrop = 100,
			size = { width = 0.83, height = 0.72 },
			margin = { top = 1, bottom = 0 },
			zindex = 60,
		})

		if cmd ~= nil and cmd[1] == "lazygit" then
			local theme = require("lazyvimx.util.system").theme_is_dark() and "dark" or "light"
			local cfg_dir = vim.fn.getenv("HOME") .. "/.config/lazygit"
			local theme_file = cfg_dir .. "/theme-" .. theme .. ".yml"
			local env_var_cfg = cfg_dir .. "/config.yml"

			if vim.fn.filereadable(theme_file) == 1 then
				env_var_cfg = env_var_cfg .. "," .. theme_file
			else
				vim.notify("Missing theme file for lazygit!", vim.log.levels.WARN)
			end

			opts = vim.tbl_deep_extend("force", opts or {}, {
				backdrop = 85,
				border = "none",
				env = { ["LG_CONFIG_FILE"] = env_var_cfg },
				size = { height = 1, width = 1 },
				margin = { top = 1, bottom = 0 },
			})
		end

		open_original(cmd, opts)
	end
end

return {
	"LazyVim/LazyVim",
	opts = override_terminal_open,
}
