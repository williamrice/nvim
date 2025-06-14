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
			callback = function(args)
				print("LSP started.")
				local opts = { noremap = true, silent = true }
				local bufnr = args.buf
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gs", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
				-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"[d",
					'<cmd>lua vim.diagnostic.goto_prev({ border = "single" })<CR>',
					opts
				)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"]d",
					'<cmd>lua vim.diagnostic.goto_next({ border = "single" })<CR>',
					opts
				)
				-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
				vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format(nil)' ]])
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
			},
		})
		-- lsp setup TODO: refactor to modules
		local lspconfig = require("lspconfig")
		local php_settings = require("config.php-settings")
		-- PHP lsp
		lspconfig.intelephense.setup({
			root_dir = lspconfig.util.root_pattern("composer.json", ".git", "wp-config.php"),
			capabilities = capabilities,
			settings = php_settings.getPhpSettings(),
		})
		--LUA lsp
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "Lua 5.1" },
					diagnostics = {
						globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
					},
				},
			},
		})
		-- ASTRO lsp
		lspconfig.astro.setup({
			capabilities = capabilities,
			filetypes = { "astro" },
		})
		-- PYTHON lsp
		lspconfig.pyright.setup({
			capabilities = capabilities,
		})
		-- C# lsp
		vim.lsp.config("roslyn", {
			on_attach = function()
				print("This will run when the server attaches!")
			end,
			settings = {
				["csharp|inlay_hints"] = {
					csharp_enable_inlay_hints_for_implicit_object_creation = true,
					csharp_enable_inlay_hints_for_implicit_variable_types = true,
				},
				["csharp|code_lens"] = {
					dotnet_enable_references_code_lens = true,
				},
			},
		})
		-- TAILWINDCSS lsp
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		-- Docker lsp
		vim.lsp.enable("docker_compose_language_service")
		vim.lsp.enable("dockerls")

		-- Dianostic configuration
		vim.diagnostic.config({
			-- update_in_insert = true,
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
