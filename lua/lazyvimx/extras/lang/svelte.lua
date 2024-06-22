local function get_capabilities()
	local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	lsp_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
	lsp_capabilities.textDocument.completion = capabilities.textDocument.completion
end

local function notify_ts_files_changed()
	LazyVim.lsp.on_attach(function(client)
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.js", "*.ts" },
			callback = function(ctx)
				client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
			end,
		})
	end)
end

local function prettier_svelte_formatter()
	local formatter = require("conform.formatters.prettier")
	formatter.args = { "--stdin-filepath", "$FILENAME" }

	return formatter
end

return {
	{ import = "lazyvim.plugins.extras.lang.svelte" },
	{ import = "lazyvim.plugins.extras.lang.typescript" },

	{ import = "lazyvimx.extras.hacks.conform-stylelint-custom-syntax-for-svelte" },

	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		opts = {
			setup = {
				svelte = function(_, opts)
					local lspconfig = require("lspconfig")

					opts.capabilities = get_capabilities()

					notify_ts_files_changed()
					lspconfig.svelte.setup(opts)
				end,
			},
		},
	},

	{
		"conform.nvim",
		opts = { formatters = { prettier_svelte = prettier_svelte_formatter() } },
	},

	{
		"conform.nvim",
		optional = true,

		opts = function(_, opts)
			if LazyVim.has_extra("formatting.prettier") then
				opts.formatters_by_ft = opts.formatters_by_ft or {}
				opts.formatters_by_ft.svelte = { "prettier_svelte", "stylelint" }
			end
		end,
	},
}
