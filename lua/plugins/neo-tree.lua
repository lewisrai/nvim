return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", { silent = true })
	end,
}
