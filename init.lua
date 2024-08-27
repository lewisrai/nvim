vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

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

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.diagnostic.config({
    signs = false,
})

vim.keymap.set("n", "<leader>l", function()
    vim.api.nvim_exec2("tabnew", {})
    vim.fn.termopen("lazygit")
end)

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>terminal<CR>")

vim.api.nvim_create_autocmd("CursorMovedI", {
    pattern = "*",
    callback = function()
        local line = vim.api.nvim_win_get_cursor(0)[1]
        if line ~= vim.b.last_line then
            vim.api.nvim_exec2("normal zz", {})
            vim.b.last_line = line

            local column = vim.fn.getcurpos()[5]
            vim.fn.cursor({ line, column })
        end
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.api.nvim_exec2("setlocal nonumber norelativenumber signcolumn=no", {})
        vim.api.nvim_exec2("startinsert", {})
    end,
})

vim.api.nvim_exec2("autocmd BufWrite * lua vim.lsp.buf.format()", {})
vim.api.nvim_exec2("autocmd CursorMoved * normal zz", {})
vim.api.nvim_exec2("autocmd TermClose * bd!", {})
vim.api.nvim_exec2("autocmd TextYankPost * lua vim.highlight.on_yank()", {})


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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
