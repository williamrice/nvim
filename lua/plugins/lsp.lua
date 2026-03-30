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
				"astro",
				"bashls",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"html",
				"intelephense",
				"laravel_ls",
				"lua_ls",
				"prismals",
				"pyright",
				"tailwindcss",
			},
			automatic_enabled = true,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"black",
				"blade-formatter",
				"php-cs-fixer",
				"prettier",
				"ruff",
				"stylua",
			},
		})
	end,
}
