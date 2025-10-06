return {
	desc = "Plugin overrides including LazyVim core, Snacks, Bufferline, and other customizations",
	recommended = true,

	{ import = "lazyvimx.overrides.lazyvim" },
	{ import = "lazyvimx.overrides.snacks" },
	{ import = "lazyvimx.overrides.bufferline" },
	{ import = "lazyvimx.overrides.other" },
}
