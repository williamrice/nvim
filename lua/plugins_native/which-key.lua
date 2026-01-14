return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>wk",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Show buffer-local keymaps (which-key)",
		},
	},
	opts = {
		preset = "modern",
		delay = 500,
		spec = {
			-- Group definitions
			{ "<leader>f", group = "Find (Telescope)" },
			{ "<leader>g", group = "Git/LSP navigation" },
			{ "<leader>n", group = "NPM package info" },
			{ "<leader>s", group = "Split/Search/Save" },
			{ "<leader>t", group = "Tab/Buffer management" },
			{ "<leader>x", group = "Diagnostics (Trouble)" },
			{ "<leader>d", group = "Debug (DAP)" },
			{ "<leader>c", group = "Code/Copilot" },
			{ "<leader>w", group = "Which-key" },
			{ "<leader>m", group = "Markdown" },
		},
	},
}
