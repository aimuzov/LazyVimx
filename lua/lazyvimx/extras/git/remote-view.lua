return {
	"moyiz/git-dev.nvim",
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
}
