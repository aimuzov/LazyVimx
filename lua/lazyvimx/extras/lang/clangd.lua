return {
	{ import = "lazyvim.plugins.extras.lang.clangd" },

	{
		"stevearc/conform.nvim",
		optional = true,

		opts = function(_, opts)
			if LazyVim.has_extra("formatting.prettier") then
				opts.formatters_by_ft = opts.formatters_by_ft or {}
				opts.formatters_by_ftc = { "clang_format" }
			end
		end,
	},
}
