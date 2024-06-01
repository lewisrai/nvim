return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "jdtls",
                "jedi_language_server",
                "lua_ls",
                "ruff",
            }
        })

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
                ["$/progress"] = function() end,
            },
        })

        lspconfig.jedi_language_server.setup({})

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                        },
                    }
                }
            }
        })

        lspconfig.ruff.setup({})

        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
        })
    end,
}
