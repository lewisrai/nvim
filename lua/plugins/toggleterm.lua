return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
	config = function()
		require("toggleterm").setup()

		vim.keymap.set("n", "<leader>t", ":ToggleTerm direction=float<CR>", {})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
		})

		function toggle_lazygit()
			lazygit:toggle()
		end

		vim.keymap.set("n", "<leader>g", ":lua toggle_lazygit()<CR>", {})
	end,
}
