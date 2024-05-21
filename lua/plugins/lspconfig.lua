return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
            }),
        })

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.biome.setup({})

        lspconfig.clangd.setup({
            capabilities = capabilities,
        })

        lspconfig.jdtls.setup({
            init_options = {
                config = "C:/Users/Raiwin/AppData/Local/Temp/jdtls/config",
                workspace = "C:/Users/Raiwin/AppData/Local/Temp/jdtls/workspace",
            },
            handlers = {
                ["$/progress"] = function() end,
            },
        })

        lspconfig.jedi_language_server.setup({})

        lspconfig.lua_ls.setup({
            on_init = function(client)
                local path = client.workspace_folders[1].name

                if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    runtime = {
                        version = "LuaJIT",
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                        }
                    },
                })
            end,

            settings = {
                Lua = {}
            }
        })

        lspconfig.ruff.setup({})

        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
        })
    end,
}
