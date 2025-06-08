return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	lazy = false,
	enable = true,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	opts = {
		extensions_list = { "ui-select", "remote-sshfs" },
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
		["remote-sshfs"] = {
			-- e.g., file_ignore_patterns = { ".git/", "node_modules/" },
		},
	},
	init = function()
		require("telescope").load_extension("remote-sshfs")
		require("telescope").load_extension("ui-select")
	end,
}
