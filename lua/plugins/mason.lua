return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                -- "jdtls",
                "jedi_language_server",
                "lua_ls",
                "ruff",
            }
        }
    },
}
