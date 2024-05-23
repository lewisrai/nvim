local logo = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
    "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
    "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
    "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
    "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    "",
    "",
}


return {
    "nvimdev/dashboard-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local new_file = function()
            vim.api.nvim_exec2("ene | startinsert", {})
        end

        local cd = function()
            vim.api.nvim_input(":cd ")
        end

        local config = function()
            vim.api.nvim_set_current_dir("C:/Users/Raiwin/Appdata/Local/nvim")
        end

        require("dashboard").setup({
            theme = "doom",
            hide = {
                statusline = false,
            },
            config = {
                header = logo,
                center = {
                    { action = require("telescope.builtin").find_files, desc = " Find File", icon = " ", key = "f" },
                    { action = new_file, desc = " New File", icon = " ", key = "n" },
                    { action = cd, desc = " Go To Directory", icon = " ", key = "g" },
                    { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                    { action = config, desc = " Config", icon = " ", key = "c" },
                    { action = "qa", desc = " Quit", icon = " ", key = "q" },
                },
                footer = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

                    return {
                        "",
                        "⚡Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
                        "",
                        "u r reading this rn",
                    }
                end,
            },
        })
    end,
}
