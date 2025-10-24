return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
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

		-- Apply capabilities to all LSP servers
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- LspAttach autocmd for keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("warice_lsp_attach", { clear = true }),
			callback = function(args)
				local bufnr = args.buf
				local opts = { buffer = bufnr, noremap = true, silent = true }

				-- Navigation
				vim.keymap.set(
					"n",
					"<leader>gs",
					vim.lsp.buf.declaration,
					vim.tbl_extend("force", opts, { desc = "Go to declaration" })
				)
				vim.keymap.set(
					"n",
					"<leader>gd",
					vim.lsp.buf.definition,
					vim.tbl_extend("force", opts, { desc = "Go to definition" })
				)
				vim.keymap.set(
					"n",
					"<leader>gi",
					vim.lsp.buf.implementation,
					vim.tbl_extend("force", opts, { desc = "Go to implementation" })
				)
				vim.keymap.set(
					"n",
					"<leader>gr",
					vim.lsp.buf.references,
					vim.tbl_extend("force", opts, { desc = "Show references" })
				)
				vim.keymap.set(
					"n",
					"K",
					vim.lsp.buf.hover,
					vim.tbl_extend("force", opts, { desc = "Hover documentation" })
				)

				-- Code actions
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					vim.tbl_extend("force", opts, { desc = "Code action" })
				)
				vim.keymap.set(
					"n",
					"<leader>rn",
					vim.lsp.buf.rename,
					vim.tbl_extend("force", opts, { desc = "Rename symbol" })
				)

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

		-- Setup fidget for LSP progress notifications
		require("fidget").setup({})

		-- Setup Mason for LSP server installation
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		})

		-- List of LSP servers to ensure are installed via Mason
		local servers = {
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
		}

		-- Auto-install servers if not already installed
		local mason_registry = require("mason-registry")
		for _, server in ipairs(servers) do
			local ok, pkg = pcall(mason_registry.get_package, server)
			if ok and not pkg:is_installed() then
				vim.notify("Installing " .. server, vim.log.levels.INFO)
				pkg:install()
			end
		end

		-- Enable LSP servers (configs extended via after/lsp/{server}.lua files)
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
