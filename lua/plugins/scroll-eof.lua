return {
	"Aasim-A/scrollEOF.nvim",
	event = "VeryLazy",
	config = function()
		require("scrollEOF").setup({
			insert_mode = true,
			floating = false,
		})
	end,
}
