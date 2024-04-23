vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.opt.fileformats = "unix,dos"
vim.opt.guicursor = ""
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.pumheight = 12
vim.opt.relativenumber = true
vim.opt.scrolloff = 26
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.wrap = false

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

vim.keymap.set("n", "<leader>l", ":Lazy<CR>", {})
