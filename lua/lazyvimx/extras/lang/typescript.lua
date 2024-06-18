return {
	{ import = "lazyvim.plugins.extras.lang.typescript" },

	{
		"stevearc/conform.nvim",
		optional = true,

		opts = function(_, opts)
			if LazyVim.has_extra("formatting.prettier") then
				opts.formatters_by_ft = opts.formatters_by_ft or {}
				opts.formatters_by_ft.typescript = opts.formatters_by_ft.typescript or {}

				vim.list_extend(opts.formatters_by_ft.typescript, { "lsp" })
			end
		end,
	},
}
