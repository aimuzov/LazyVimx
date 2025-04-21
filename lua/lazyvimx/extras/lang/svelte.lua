local function prettier_svelte_formatter()
	local formatter = require("conform.formatters.prettier")
	formatter.args = { "--stdin-filepath", "$FILENAME" }

	return formatter
end

return {
	{ import = "lazyvim.plugins.extras.lang.svelte" },
	{ import = "lazyvim.plugins.extras.lang.typescript" },

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = { formatters = { prettier_svelte = prettier_svelte_formatter() } },
	},

	{
		"stevearc/conform.nvim",
		optional = true,

		opts = function(_, opts)
			require("conform").formatters.stylelint = function(bufnr)
				local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
				local prepend_args = filetype == "svelte" and { "--custom-syntax", "postcss-html" } or {}
				local command = require("conform.util").find_executable({ "node_modules/.bin/stylelint" }, "stylelint")

				return {
					command = command,
					prepend_args = prepend_args,
				}
			end

			if LazyVim.has_extra("formatting.prettier") then
				opts.formatters_by_ft = opts.formatters_by_ft or {}
				opts.formatters_by_ft.svelte = { "prettier_svelte", "stylelint" }
			end
		end,
	},

	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = function(_, opts)
			if LazyVim.has_extra("linting.eslint") then
				if opts.servers.stylelint_lsp == nil then
					opts.servers.stylelint_lsp = { filetypes = {} }
				end

				table.insert(opts.servers.stylelint_lsp.filetypes, "svelte")
			end
		end,
	},
}
