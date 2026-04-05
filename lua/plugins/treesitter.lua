return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			branch = "main",
		},
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function(_, _)
		require("nvim-treesitter").install({
			"bash",
			"blade",
			"c_sharp",
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"javascript",
			"html",
			"css",
			"tsx",
			"json",
			"php",
			"php_only",
			"typescript",
			"markdown",
			"markdown_inline",
			"yaml",
			"toml",
			"dockerfile",
			"gitignore",
		})

		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
			},
		})
	end,
}
