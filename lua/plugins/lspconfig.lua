return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    opts = {
        servers = {
            biome = {},
            clangd = {},
            -- jdtls = {
            --     cmd = {
            --         "jdtls",
            --         "-configuration",
            --         "C:/Users/Raiwin/AppData/Local/Temp/jdtls/config",
            --         "-data",
            --         "C:/Users/Raiwin/AppData/Local/Temp/jdtls/workspace",
            --     },
            --     handlers = {
            --         ["$/progress"] = function() end,
            --     },
            -- },
            jedi_language_server = {},
            lua_ls = {
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
            },
            ruff = {},
            rust_analyzer = {},
        },
    },
    config = function(_, opts)
        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        for server, config in pairs(opts.servers) do
            config.capabilities = capabilities
            lspconfig[server].setup(config)
        end
    end,
}
