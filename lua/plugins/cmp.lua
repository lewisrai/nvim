return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = {
            "saadparwaiz1/cmp_luasnip"
        }
    },

    {
        "hrsh7th/cmp-nvim-lsp"
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({select = true}),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    {name = "luasnip"},
                }, {
                    {name = "buffer"},
                })
            })

            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {desc = "Info"})
        end
    }
}
