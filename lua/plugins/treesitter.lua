return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			ensure_installed = {
				"c",
				"css",
				"csv",
				"html",
				"java",
				"javascript",
				"json",
				"lua",
				"python",
				"rust",
				"toml",
				"yaml",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
