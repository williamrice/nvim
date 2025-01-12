local header = [[
____    __    ____  ___      .______      
\   \  /  \  /   / /   \     |   _  \     
 \   \/    \/   / /  ^  \    |  |_)  |    
  \            / /  /_\  \   |      /     
   \    /\    / /  _____  \  |  |\  \----.
    \__/  \__/ /__/     \__\ | _| `._____|]]

return {
	"folke/snacks.nvim",
	enabled = true,
	lazy = false,
	opts = {
		dashboard = {
			enabled = true,
			preset = {
				header = header
			},
		},
		indent = {
			enabled = true,
			chunk = {
				enabled = true,
			},
		},
		notifier = { enabled = true, timeout = 3000, border = "rounded" },
	},
}
