return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = false,
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {},
				never_show = { ".git", ".DS_Store", "node_modules", ".cache" },
			},
		},
		close_if_last_window = true,
		window = {
			position = "left",
			width = 30,
		},
	},
}
