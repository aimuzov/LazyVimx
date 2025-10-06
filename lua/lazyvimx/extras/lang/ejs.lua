return {
	"nvim-treesitter/nvim-treesitter",
	desc = "EJS (Embedded JavaScript) template support with treesitter highlighting",

	opts = function(_, opts)
		opts.ensure_installed = opts.ensure_installed or {}

		vim.list_extend(opts.ensure_installed, { "embedded_template" })
		vim.treesitter.language.register("eruby", { "ejs" })
		vim.filetype.add({ extension = { ejs = "eruby" } })
	end,
}
