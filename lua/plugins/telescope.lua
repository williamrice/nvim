return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	lazy = false,
	enable = true,
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		require("telescope").load_extension("remote-sshfs")
	end,
}
