return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			on_close = function()
				require("neo-tree.sources.manager").refresh("filesystem")
			end,
		})

		vim.keymap.set("n", "<leader>t", function()
			vim.api.nvim_exec("ToggleTerm direction=float", false)
		end, {})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
		})

		vim.keymap.set("n", "<leader>g", function()
			lazygit:toggle()
		end, {})
	end,
}
