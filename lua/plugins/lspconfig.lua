return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
                ["rust_analyzer"] = {
                    diagnostics = {
                        enable = true
                    }
                }
            }
        })

        vim.diagnostic.config({
            signs = false
        })
    end
}
