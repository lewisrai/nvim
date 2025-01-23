return {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
        bigfile = {},
        notifier = {},
        picker = {},
    },
    config = function(_, opts)
        require("snacks").setup(opts)

        vim.keymap.set("n", "<leader>f", Snacks.picker.files)
        vim.keymap.set("n", "<leader>g", Snacks.picker.grep)
        vim.keymap.set("n", "<leader>b", Snacks.picker.buffers)

        vim.api.nvim_create_autocmd("LspProgress", {
            callback = function(ev)
                local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                vim.notify(vim.lsp.status(), "info", {
                    id = "lsp_progress",
                    title = "LSP Progress",
                    opts = function(notif)
                        notif.icon = ev.data.params.value.kind == "end" and " "
                            or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                    end,
                })
            end,
        })
    end,
}
