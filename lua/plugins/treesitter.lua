return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
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
				"wgsl",
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
