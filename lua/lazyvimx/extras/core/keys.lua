local function create(plugin_name, keys)
	for _, value in pairs(keys) do
		value["desc"] = value["desc"] or "Description not setted"

		if type(value[2]) == "string" then
			value[2] = "<cmd>" .. value[2] .. "<cr>"
		end
	end

	return {
		plugin_name,
		optional = true,
		keys = keys,
	}
end

return {
	recommended = true,

	create("LazyVim/LazyVim", {
		{ "<leader>ll", "Lazy", desc = "Open popup with lazy dashboard" },
		{ "<leader>lx", "LazyExtras", desc = "Open popup with lazy extras" },
	}),

	create("folke/zen-mode.nvim", {
		{ "<leader>uz", "ZenMode", desc = "Toggle zen mode" },
	}),

	create("dnlhc/glance.nvim", {
		{ "<leader>gd", "Glance definitions", desc = "Show definitions (peek window)" },
		{ "<leader>gr", "Glance references", desc = "Show references (peek window)" },
		{ "<leader>gy", "Glance type_definitions", desc = "Show type definitions (peek window)" },
		{ "<leader>gm", "Glance implementations", desc = "Show implementations (peek window)" },
	}),
}
