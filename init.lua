vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.loaded_gzip = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
--vim.g.loaded_tutor = 1
vim.g.loaded_zipPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = "="

vim.opt.mouse = ""
vim.opt.timeoutlen = 250
vim.opt.undofile = true

vim.opt.cursorline = true
vim.opt.guicursor = ""
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showtabline = 0
vim.opt.signcolumn = "yes"

vim.opt.expandtab = true
vim.opt.fileformats = "unix,dos"
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.diagnostic.config({ signs = false })

vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>o", vim.lsp.buf.definition)

vim.keymap.set("n", "<leader>t", "<cmd>terminal<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>terminal lazygit<CR>")

-- vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<CR>")
-- vim.keymap.set("n", "<leader>mm", "<cmd>Mason<CR>")
-- vim.keymap.set("n", "<leader>mn", "<cmd>ene | startinsert")
vim.keymap.set("n", "<leader>mc", "<cmd>wa! | %bd! | cd C:/Users/Raiwin/Appdata/Local/nvim | e .<CR>")
-- vim.keymap.set("n", "<leader>mp", "<cmd>wa! | %bd! | cd C:/Code/Projects | e .<CR>")

function Center_Cursor(insert_mode)
    local line = vim.api.nvim_win_get_cursor(0)[1]

    if vim.b.last_line == nil then
        vim.b.last_line = line
    end

    if line ~= vim.b.last_line then
        vim.api.nvim_exec2("normal! zz", {})
        vim.b.last_line = line

        if insert_mode then
            vim.fn.cursor({ line, vim.fn.getcurpos()[5] })
        end
    end
end

vim.api.nvim_exec2("autocmd BufWrite * lua vim.lsp.buf.format()", {})
vim.api.nvim_exec2("autocmd CursorMoved * lua Center_Cursor(false)", {})
vim.api.nvim_exec2("autocmd CursorMovedI * lua Center_Cursor(true)", {})
vim.api.nvim_exec2("autocmd TermClose * bd!", {})
vim.api.nvim_exec2("autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no", {})
vim.api.nvim_exec2("autocmd TermOpen * startinsert", {})
vim.api.nvim_exec2("autocmd TextYankPost * lua vim.highlight.on_yank()", {})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})

        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "default" } },
    rocks = { enabled = false },
})
