return {

	{
		"neovim/nvim-lspconfig",
		optional = true,

		opts = function(_, opts)
			if not opts.inlay_hints.enabled then
				return
			end

			vim.api.nvim_create_autocmd("InsertEnter", {
				callback = function(event)
					vim.lsp.inlay_hint.enable(false, { bufnr = event.buf })
					vim.cmd([[ normal "hl" ]])
				end,
			})

			vim.api.nvim_create_autocmd("InsertLeave", {
				callback = function(event)
					vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
				end,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		optional = true,
		opts = function()
			vim.api.nvim_create_autocmd("InsertEnter", {
				callback = function()
					require("treesitter-context").disable()
				end,
			})

			vim.api.nvim_create_autocmd("InsertLeave", {
				callback = function(event)
					require("treesitter-context").enable()
				end,
			})
		end,
	},

	{
		"Wansmer/symbol-usage.nvim",
		optional = true,

		opts = function()
			vim.api.nvim_create_autocmd("InsertEnter", {
				callback = function(event)
					require("symbol-usage.buf").clear_buffer(event.buf)
				end,
			})

			vim.api.nvim_create_autocmd("InsertLeave", {
				callback = function(event)
					require("symbol-usage.buf").attach_buffer(event.buf)
				end,
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		optional = true,

		opts = function(_, opts)
			vim.api.nvim_create_autocmd("InsertEnter", {
				callback = function()
					require("ibl").update({ enabled = false })
				end,
			})

			vim.api.nvim_create_autocmd("InsertLeave", {
				callback = function()
					require("ibl").update({ enabled = true })
				end,
			})
		end,
	},

	{
		"lukas-reineke/virt-column.nvim",
		optional = true,

		opts = function(_, opts)
			vim.api.nvim_create_autocmd("InsertEnter", {
				callback = function()
					require("virt-column").update({ enabled = false })
				end,
			})

			vim.api.nvim_create_autocmd("InsertLeave", {
				callback = function()
					require("virt-column").update({ enabled = true })
				end,
			})
		end,
	},
}
