return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				file_ignore_patterns = { "node_modules", ".git/", "%.lock" },
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				["remote-sshfs"] = {},
			},
		})

		-- Load extensions
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")
		pcall(telescope.load_extension, "remote-sshfs")
	end,
}
