local function override_lazyvim_toggle_diagnostic()
	local toggle_diagnostic = LazyVim.toggle.diagnostics

	LazyVim.toggle.diagnostics = function()
		if LazyVim.has("tiny-inline-diagnostic.nvim") then
			if vim.diagnostic.is_enabled() then
				require("tiny-inline-diagnostic").disable()
			else
				require("tiny-inline-diagnostic").enable()
			end
		end

		toggle_diagnostic()
	end
end

return {
	"LazyVim/LazyVim",
	opts = override_lazyvim_toggle_diagnostic,
}
