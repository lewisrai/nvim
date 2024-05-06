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

vim.keymap.set("n", "<leader>l", function()
	vim.api.nvim_exec("Lazy", false)
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
})

vim.keymap.set("n", "<leader>t", function()
	vim.api.nvim_exec("terminal", false)
end, {})

vim.keymap.set("n", "<leader>g", function()
	vim.api.nvim_exec("terminal", false)
end, {})
