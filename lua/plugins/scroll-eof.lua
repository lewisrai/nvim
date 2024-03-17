return {
	"Aasim-A/scrollEOF.nvim",
	event = { "CursorMoved", "WinScrolled" },
	config = function()
		local config = require("scrollEOF")
		config.setup({
			insert_mode = true,
			floating = false,
		})
	end,
}
