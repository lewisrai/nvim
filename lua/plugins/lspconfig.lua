return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.biome.setup({})

		lspconfig.clangd.setup({
			capabilities = capabilities,
		})

		lspconfig.jdtls.setup({
			cmd = {
				"jdtls",
				"-configuration",
				"C:/Users/Raiwin/AppData/Local/Temp/jdtls/config",
				"-data",
				"C:/Users/Raiwin/AppData/Local/Temp/jdtls/workspace",
			},

			handlers = {
				["$/progress"] = function(_, _, _) end,
			},
		})

		lspconfig.jedi_language_server.setup({})

		lspconfig.ruff.setup({})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			settings = {
				["rust_analyzer"] = {
					diagnostics = {
						enable = true,
					},
				},
			},
		})

		vim.diagnostic.config({
			signs = false,
		})
	end,
}
