return {
	"mistricky/codesnap.nvim",
	build = "make",
	keys = {
		{ "<leader>cs", "<cmd>CodeSnapcr", mode = { "x", "v" }, desc = "Capture code snippet" },
	},
	opts = {
		bg_theme = "#636363",
		watermark = "",
		mac_window_bar = false
	}
}
