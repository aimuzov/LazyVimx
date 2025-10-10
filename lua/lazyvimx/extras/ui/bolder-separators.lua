return {
	"LazyVim/LazyVim",
	desc = "Heavy Unicode window separators with bold characters for more prominent divisions",
	opts = function()
		vim.opt.fillchars:append({
			horiz = "━",
			horizdown = "┳",
			horizup = "┻",
			vert = "┃",
			verthoriz = "╋",
			vertleft = "┫",
			vertright = "┣",
		})
	end,
}
