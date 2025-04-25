return {
	"mfussenegger/nvim-lint",
	opts = function(_, opts)
		local cspell_path = require("lazyvimx.util.general").popen_get_result("which cspell")

		if cspell_path:find(vim.fn.getcwd(), 1, true) then
			opts.linters_by_ft["*"] = opts.linters_by_ft["*"] or {}
			table.insert(opts.linters_by_ft["*"], "cspell")
		end
	end,
}
