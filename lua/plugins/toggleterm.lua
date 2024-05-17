return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup({
			on_close = function()
				require("neo-tree.sources.manager").refresh("filesystem")
			end,
		})

		vim.keymap.set("n", "<leader>t", ":ToggleTerm direction=float<CR>", { silent = true })

		local lazygit = require("toggleterm.terminal").Terminal:new({
			cmd = "lazygit",
			direction = "float",
		})

		vim.keymap.set("n", "<leader>g", function()
			lazygit:toggle()
		end, {})
	end,
}
