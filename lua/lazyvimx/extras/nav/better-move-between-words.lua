return {
	"chrisgrieser/nvim-spider",
	config = true,
	dependencies = {
		"theHamsta/nvim_rocks",
		build = "pip3 install --user hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
		config = function()
			require("nvim_rocks").ensure_installed("luautf8")
		end,
	},
}
