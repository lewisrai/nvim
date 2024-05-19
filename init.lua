vim.opt.cursorline = true
vim.opt.guicursor = ""
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
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

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>cc", "<cmd>cd C:\\Users\\Raiwin\\Appdata\\Local\\nvim<CR>")
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>term<CR>")

function auto_centre_insert()
    local line = vim.api.nvim_win_get_cursor(0)[1]
    if line ~= vim.b.last_line then
        vim.api.nvim_exec("norm zz", false)
        vim.b.last_line = line

        local column = vim.fn.getcurpos()[5]
        vim.fn.cursor({ line, column })
    end
end

function setup_terminal()
    vim.api.nvim_exec("setlocal nonumber", false)
    vim.api.nvim_exec("setlocal norelativenumber", false)
    vim.api.nvim_exec("setlocal signcolumn=no", false)
    vim.api.nvim_exec("startinsert", false) 
end

vim.api.nvim_exec("au BufWrite * lua vim.lsp.buf.format()", false)
vim.api.nvim_exec("au CursorMoved * norm zz", false)
vim.api.nvim_exec("au CursorMovedI * lua auto_centre_insert()", false)
vim.api.nvim_exec("au TermOpen * lua setup_terminal()", false)
vim.api.nvim_exec("au TextYankPost * lua vim.highlight.on_yank()", false)


lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
