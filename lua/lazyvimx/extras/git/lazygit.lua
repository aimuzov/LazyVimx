local function get_env_var_cfg()
	local theme = require("lazyvimx.util.system").theme_is_dark() and "dark" or "light"
	local cfg_dir = vim.fn.getenv("HOME") .. "/.config/lazygit"
	local env_var_cfg = cfg_dir .. "/config.yml"

	if vim.fn.filereadable(env_var_cfg) ~= 1 then
		open_original(opts)
		return
	end

	local theme_file = cfg_dir .. "/theme-" .. theme .. ".yml"

	if vim.fn.filereadable(theme_file) == 1 then
		env_var_cfg = env_var_cfg .. "," .. theme_file
	else
		vim.notify("Missing theme file for lazygit!", vim.log.levels.WARN)
	end

	return env_var_cfg
end

local function override_terminal_open()
	local Snacks = require("snacks")
	local open_original = Snacks.lazygit.open

	Snacks.lazygit.open = function(opts)
		opts = vim.tbl_deep_extend("force", opts, {
			configure = false,
			env = { ["LG_CONFIG_FILE"] = get_env_var_cfg() },
		})

		open_original(opts)
	end
end

return {
	{
		"folke/snacks.nvim",
		opts = {
			lazygit = {
				win = {
					border = "none",
					height = 0.86,
					width = 0.95,
				},
			},
		},
	},

	{
		"folke/snacks.nvim",
		opts = override_terminal_open,
	},
}
