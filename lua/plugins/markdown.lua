return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons", -- For icons in code blocks
	},
	ft = "markdown", -- Only load for markdown files
	opts = {
		-- Render markdown when opening file
		enabled = true,
		-- Max file size to render (100KB default)
		max_file_size = 10.0,
		-- Debounce for re-rendering
		debounce = 100,
		-- Render markdown in all modes (not just normal mode)
		render_modes = { "n", "c", "i" },
		-- Anti-conceal: hide rendering on cursor line
		anti_conceal = {
			enabled = true,
		},
		heading = {
			enabled = true,
			sign = true,
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
			-- Background colors for headings
			backgrounds = {
				"RenderMarkdownH1Bg",
				"RenderMarkdownH2Bg",
				"RenderMarkdownH3Bg",
				"RenderMarkdownH4Bg",
				"RenderMarkdownH5Bg",
				"RenderMarkdownH6Bg",
			},
		},
		code = {
			enabled = true,
			sign = true,
			style = "full",
			width = "block",
			left_pad = 2,
			right_pad = 2,
		},
		bullet = {
			enabled = true,
			icons = { "●", "○", "◆", "◇" },
		},
	},
	config = function(_, opts)
		require("render-markdown").setup(opts)
	end,
}
