return {
	"folke/trouble.nvim",
	lazy = false,
	opts = {
		auto_close = true,
	},
	cmd = "Trouble",
	config = function()
		-- Diagnostic configuration
		vim.diagnostic.config({
			virtual_text = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "if_many",
				header = "",
				prefix = "",
			},
		})
	end,
}
