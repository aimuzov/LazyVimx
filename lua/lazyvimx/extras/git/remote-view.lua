local function repo_remote_open()
	local url = vim.fn.expand("<cfile>")

	if not url or url == "" then
		return
	end

	local gdev_path = vim.fn.stdpath("cache") .. "/git-dev"
	local is_gdev = vim.startswith(vim.fn.expand("%:p"), gdev_path)
	local opener = is_gdev and vim.bo.filetype == "markdown" and require("git-dev").open or vim.ui.open

	opener(url)
end

local function repo_remote_enter_and_open()
	local uri = vim.fn.input("uri (author/repo): ")

	if uri == "" then
		return
	end

	vim.ui.select({ "gitdev", "default" }, { prompt = "Select opener" }, function(choice)
		if choice == "gitdev" then
			vim.cmd("GitDevOpen " .. uri)
		elseif choice == "default" then
			vim.ui.open(uri)
		end
	end)
end

return {
	{
		"moyiz/git-dev.nvim",
		desc = "Open remote git repositories in the comfort of Neovim",
		event = "VeryLazy",

		opts = {
			cd_type = "tab",
			opener = function(dir, repo_uri)
				local readme_variants = { "README.md", "readme.md", "README", "README.txt", "readme.txt" }

			-- stylua: ignore
			local to_open = vim
				.iter(readme_variants)
				:map(function(f) return vim.fs.joinpath(dir, f) end)
				:find(vim.uv.fs_stat)

				local cmd = to_open and "e " .. to_open .. " | Neotree show" or "Neotree dir=" .. dir

				vim.cmd("tabnew | " .. cmd)

				vim.schedule(function()
					vim.print("Opening " .. repo_uri)
				end)
			end,
		},
	},

	{
		"moyiz/git-dev.nvim",

		opts = function()
			require("git-dev").repo_remote_open = repo_remote_open
			require("git-dev").repo_remote_enter_and_open = repo_remote_enter_and_open

			vim.cmd("command! GitDevRemoteOpen lua require('git-dev').repo_remote_open()")
			vim.cmd("command! GitDevRemoteEnterAndOpen lua require('git-dev').repo_remote_enter_and_open()")
		end,
	},
}
