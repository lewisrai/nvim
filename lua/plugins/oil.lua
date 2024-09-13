return {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    config = function()
        require("oil").setup({
            keymaps = {
                ["<CR>"] = "actions.select",
                ["<C-c>"] = "actions.close",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["~"] = "actions.cd",
            },

            use_default_keymaps = false,

            view_options = {
                show_hidden = true,
            },
        })

        vim.keymap.set("n", "-", "<cmd>Oil<CR>", {})
    end
}
