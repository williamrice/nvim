return {
	"EdenEast/nightfox.nvim",
	enabled = true,
	lazy = false,
	priority = 999,
	config = function()
		vim.cmd.colorscheme("carbonfox")
		vim.api.nvim_set_hl(0, "@punctuation.bracket.php", { fg = "#cb9405", bold = true })
	end,
}
