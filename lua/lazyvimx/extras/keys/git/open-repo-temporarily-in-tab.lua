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
	"moyiz/git-dev.nvim",
	optional = true,

	keys = {
		{ "gx", repo_remote_open, desc = "Open a remote git repository; open (tab)" },
		{ "gX", repo_remote_enter_and_open, desc = "Enter a remote git repository; open (tab)" },
	},
}
