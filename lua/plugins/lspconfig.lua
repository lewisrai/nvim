return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.biome.setup({
			root_dir = lspconfig.util.root_pattern(".git", "biome.json", "biome.jsonc"),
		})

		lspconfig.clangd.setup({
			capabilities = capabilities,
		})

		lspconfig.jdtls.setup({
			cmd = {
				"jdtls",
				"-configuration",
				"C:/Users/Raiwin/Appdata/Local/jdtls/config",
				"-data",
				"C:/Users/Raiwin/Appdata/Local/jdtls/workspace",
			},
		})

		lspconfig.jedi_language_server.setup({})

		lspconfig.ruff_lsp.setup({})

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
