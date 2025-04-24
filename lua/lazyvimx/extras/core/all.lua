return {
	{ import = "lazyvimx.extras.core.overrides" },
	{ import = "lazyvimx.extras.core.colorscheme" },
	{ import = "lazyvimx.extras.core.extras" },
	{ import = "lazyvimx.extras.core.keys" },

	{
		"folke/snacks.nvim",
		opts = function()
			local recommended_extras = {
				"coding.mini-surround",
				"coding.yanky",
				"editor.snacks_picker",
				"ui.alpha",
				"ui.edgy",
				"ui.treesitter-context",
			}

			local extras_missing = {}

			for _, extra_name in pairs(recommended_extras) do
				if not LazyVim.has_extra(extra_name) then
					table.insert(extras_missing, "- `" .. extra_name .. "`")
				end
			end

			if next(extras_missing) ~= nil then
				Snacks.notify.info({
					"Missing extras:",
					unpack(extras_missing),
					"Highly recommend turning them on",
					"for the best experience",
				}, { icon = "[ 󰬟 ]" })
			end
		end,
	},
}
