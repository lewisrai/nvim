return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.biome.setup({})

		lspconfig.clangd.setup({
			capabilities = capabilities,
		})

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
