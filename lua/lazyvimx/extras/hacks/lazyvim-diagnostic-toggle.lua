local function override_lazyvim_toggle_diagnostic()
	local toggle_diagnostic_set_orig = LazyVim.toggle.diagnostics.set

	LazyVim.toggle.diagnostics.set = function(value)
		if LazyVim.has("tiny-inline-diagnostic.nvim") then
			if value == true then
				require("tiny-inline-diagnostic").enable()
			else
				require("tiny-inline-diagnostic").disable()
			end
		end

		toggle_diagnostic_set_orig(value)
	end
end

return {
	"LazyVim/LazyVim",
	opts = override_lazyvim_toggle_diagnostic,
}
