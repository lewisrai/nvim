return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VimEnter",
    opts = function()
        vim.keymap.set("n", "-", "<cmd>Oil<CR>");

        return {
            delete_to_trash = true,

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
        }
    end,
}
