return {
	"mfussenegger/nvim-lint",
	opts = function(_, opts)
		if vim.fn.executable("cspell") == 1 then
			opts.linters_by_ft["*"] = opts.linters_by_ft["*"] or {}
			table.insert(opts.linters_by_ft["*"], "cspell")
		end
	end,
}
