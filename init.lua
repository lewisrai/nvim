vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.timeoutlen = 300
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

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.diagnostic.config({
    signs = false,
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>o", vim.lsp.buf.definition)

vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>terminal<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>terminal lazygit<CR>")

vim.keymap.set("n", "<leader>mg", "<cmd>cd ", {})
vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<CR>", {})
vim.keymap.set("n", "<leader>mm", "<cmd>Mason<CR>", {})
vim.keymap.set("n", "<leader>mn", "<cmd>ene | startinsert", {})
vim.keymap.set("n", "<leader>mc", "<cmd>wa! | %bd! | cd C:/Users/Raiwin/Appdata/Local/nvim<CR>", {})
vim.keymap.set("n", "<leader>mp", "<cmd>wa! | %bd! | cd C:/Code/Projects<CR>", {})

function Center_Cursor_I()
    local line = vim.api.nvim_win_get_cursor(0)[1]

    if line ~= vim.b.last_line then
        vim.api.nvim_exec2("normal zz", {})
        vim.b.last_line = line

        local column = vim.fn.getcurpos()[5]
        vim.fn.cursor({ line, column })
    end
end

vim.api.nvim_exec2("autocmd BufWrite * lua vim.lsp.buf.format()", {})
vim.api.nvim_exec2("autocmd CursorMoved * normal zz", {})
vim.api.nvim_exec2("autocmd CursorMovedI * lua Center_Cursor_I()", {})
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
    rocks = {
        enabled = false,
    }
})
