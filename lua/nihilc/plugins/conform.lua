return {
	"stevearc/conform.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
	},
	config = function()
		local conform = require("conform")
		local keymaps = require("nihilc.keymaps")

		conform.setup({
			formatters_by_ft = {
				-- Web
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				-- Languages
				sh = { "shfmt" },
				python = { "black" },
				lua = { "stylua" },
				-- Docs / Config
				markdown = { "prettier" },
			},
		})

		keymaps.set({
			{
				desc = "Lsp/Conform Format",
				lhs = "<leader>lf",
				rhs = function()
					conform.format({ lsp_format = "fallback" })
				end,
			},
		})
	end,
}
