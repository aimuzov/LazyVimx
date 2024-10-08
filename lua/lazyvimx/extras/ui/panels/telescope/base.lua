local function open_selected(prompt_bufnr)
	local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
	local multi = picker:get_multi_selection()

	if not vim.tbl_isempty(multi) then
		require("telescope.actions").close(prompt_bufnr)

		for _, j in pairs(multi) do
			if j.path ~= nil then
				vim.cmd(string.format("%s %s", "edit", j.path))
			end
		end
	else
		require("telescope.actions").select_default(prompt_bufnr)
	end
end

local picker_dropdown = {
	theme = "dropdown",
	previewer = false,
}

return {
	"nvim-telescope/telescope.nvim",
	optional = true,

	opts = {
		defaults = {
			layout_strategy = "vertical",
			layout_config = {
				height = 0.95,
				width = 0.8,
				preview_cutoff = 20,
			},
			mappings = {
				i = {
					["<c-s>"] = nil,
					["<cr>"] = open_selected,
				},

				n = {
					["s"] = nil,
					["<cr>"] = open_selected,
				},
			},
		},

		pickers = {
			buffers = picker_dropdown,
			colorscheme = picker_dropdown,
			find_files = picker_dropdown,
			git_files = picker_dropdown,
			highlights = picker_dropdown,
			lsp_document_symbols = { layout_strategy = "horizontal" },
		},
	},

	keys = {
		{
			"<leader>fc",
			"<cmd>Telescope find_files cwd=" .. require("lazyvimx.util.system").get_dotfiles_path() .. "<cr>",
			desc = "Find dotfile",
		},
	},

	config = function(_, opts)
		require("telescope").setup(opts)

		if LazyVim.has("telescope-file-browser.nvim") then
			require("telescope").load_extension("file_browser")
		end

		if LazyVim.has("telescope-fzf-native.nvim") then
			require("telescope").load_extension("fzf")
		end

		if LazyVim.has("telescope-live-grep-args.nvim") then
			require("telescope").load_extension("live_grep_args")
		end

		if LazyVim.has("scope.nvim") then
			require("telescope").load_extension("scope")
		end

		if LazyVim.has("advanced-git-search.nvim") then
			require("telescope").load_extension("advanced_git_search")
		end

		if LazyVim.has("smart-open.nvim") then
			require("telescope").load_extension("smart_open")
		end
	end,
}
