return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"astro",
				"bash",
				"c_sharp",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"html",
				"tsx",
				"json",
				"php",
				"typescript",
			},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			modules = {},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
