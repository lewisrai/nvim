return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.biome,
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}
