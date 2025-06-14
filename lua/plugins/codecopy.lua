return {
	-- "Zonric/codecopy.nvim",
	dir = vim.fn.expand("$HOME/dev/codecopy.nvim"),
	enabled = true,
	lazy = true,
	event = "VeryLazy",
	opts = {
		notify = true,
		openui = true,
		debug = true,
		include_file_path = true,
		env = {
			enabled = true,
		},
		webhook = {
			branding = true,
			embed = true,
			author = {
				name = "Zonric",
				profile = "https://www.github.com/Zonric",
			},
			url = "https://discord.com/api/webhooks/1381636144353251509/4a3SjHGmnMhGZ4xRlptrMM2Gt5qQ3-7cdUEnwxKXKT_8nhpxUGCBoI0J93vwT1w-TAlL",
		},
	},
}
