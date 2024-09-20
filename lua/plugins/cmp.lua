return {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    opts = function()
        local cmp = require("cmp")

        return {
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
            }),
        }
    end,
}
