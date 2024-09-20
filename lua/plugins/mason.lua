return {
    {
        "williamboman/mason.nvim", event = "VeryLazy", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = {
                "clangd",
                "jdtls",
                "jedi_language_server",
                "lua_ls",
                "ruff",
            }
        }
    },
}
