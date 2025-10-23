return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
	},
	config = function()
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("warice_lsp_attach", { clear = true }),
			callback = function(args)
				local bufnr = args.buf
				local opts = { buffer = bufnr, noremap = true, silent = true }

				-- Navigation
				vim.keymap.set("n", "<leader>gs", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
				vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Show references" }))
				vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))

				-- Code actions
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))

				-- Diagnostics
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = { border = "single" } })
				end, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = { border = "single" } })
				end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))

				-- Format command
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
					vim.lsp.buf.format()
				end, { desc = "Format buffer with LSP" })
			end,
		})

		require("fidget").setup({})
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		})
		require("mason-lspconfig").setup({
			automatic_installation = true,
			automatic_enable = false,
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
			},
		})

		local php_settings = require("config.php-settings")

		-- PHP
		vim.lsp.config.intelephense = {
			root_markers = { "composer.json", ".git", "wp-config.php" },
			capabilities = capabilities,
			settings = php_settings.getPhpSettings(),
		}

		-- Lua
		vim.lsp.config.lua_ls = {
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "Lua 5.1" },
					diagnostics = {
						globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
					},
				},
			},
		}

		-- Astro
		vim.lsp.config.astro = {
			capabilities = capabilities,
			filetypes = { "astro" },
		}

		-- Python
		vim.lsp.config.pyright = {
			capabilities = capabilities,
		}

		-- C#
		vim.lsp.config.roslyn = {
			settings = {
				["csharp|inlay_hints"] = {
					csharp_enable_inlay_hints_for_implicit_object_creation = true,
					csharp_enable_inlay_hints_for_implicit_variable_types = true,
				},
				["csharp|code_lens"] = {
					dotnet_enable_references_code_lens = true,
				},
			},
		}

		-- TailwindCSS
		vim.lsp.config.tailwindcss = {
			capabilities = capabilities,
		}

		-- HTML
		vim.lsp.config.html = {
			capabilities = capabilities,
		}

		-- CSS
		vim.lsp.config.cssls = {
			capabilities = capabilities,
		}

		-- Enable LSP servers
		vim.lsp.enable("intelephense")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("astro")
		vim.lsp.enable("pyright")
		vim.lsp.enable("roslyn")
		vim.lsp.enable("tailwindcss")
		vim.lsp.enable("docker_compose_language_service")
		vim.lsp.enable("dockerls")
		vim.lsp.enable("prismals")
		vim.lsp.enable("html")
		vim.lsp.enable("cssls")

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
