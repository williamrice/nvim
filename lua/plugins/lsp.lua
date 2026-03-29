return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"j-hui/fidget.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		-- Setup fidget for LSP progress notifications
		require("fidget").setup({})

		-- Setup Mason for LSP server installation
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
			dependencies = {},
		})

		-- List of LSP servers to ensure are installed via Mason
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"intelephense",
				"astro",
				"pyright",
				"tailwindcss",
				"docker_compose_language_service",
				"dockerls",
				"prismals",
				"html",
				"cssls",
				"bashls",
			},
			automatic_enabled = true,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"black",
				"ruff",
			},
		})
	end,
}
