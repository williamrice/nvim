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
		local function on_attach(client, bufnr)
			-- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
			local opts = { noremap = true, silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "v", "<C-k>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
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
		end

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"lua_ls",
				"intelephense",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
				["intelephense"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.intelephense.setup({
						root_dir = lspconfig.util.root_pattern("composer.json", ".git", "wp-config.php"),
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							intelephense = {
								files = {
									maxSize = 5000000,
								},
								stubs = {
									"amqp",
									"apache",
									"apcu",
									"bcmath",
									"blackfire",
									"bz2",
									"calendar",
									"cassandra",
									"com_dotnet",
									"Core",
									"couchbase",
									"crypto",
									"ctype",
									"cubrid",
									"curl",
									"date",
									"dba",
									"decimal",
									"dom",
									"ds",
									"enchant",
									"Ev",
									"event",
									"exif",
									"fann",
									"FFI",
									"ffmpeg",
									"fileinfo",
									"filter",
									"fpm",
									"ftp",
									"gd",
									"gearman",
									"geoip",
									"geos",
									"gettext",
									"gmagick",
									"gmp",
									"gnupg",
									"grpc",
									"hash",
									"http",
									"ibm_db2",
									"iconv",
									"igbinary",
									"imagick",
									"imap",
									"inotify",
									"interbase",
									"intl",
									"json",
									"judy",
									"ldap",
									"leveldb",
									"libevent",
									"libsodium",
									"libxml",
									"lua",
									"lzf",
									"mailparse",
									"mapscript",
									"mbstring",
									"mcrypt",
									"memcache",
									"memcached",
									"meminfo",
									"meta",
									"ming",
									"mongo",
									"mongodb",
									"mosquitto-php",
									"mqseries",
									"msgpack",
									"mssql",
									"mysql",
									"mysql_xdevapi",
									"mysqli",
									"ncurses",
									"newrelic",
									"oauth",
									"oci8",
									"odbc",
									"openssl",
									"parallel",
									"Parle",
									"pcntl",
									"pcov",
									"pcre",
									"pdflib",
									"PDO",
									"pdo_ibm",
									"pdo_mysql",
									"pdo_pgsql",
									"pdo_sqlite",
									"pgsql",
									"Phar",
									"phpdbg",
									"posix",
									"pspell",
									"pthreads",
									"radius",
									"rar",
									"rdkafka",
									"readline",
									"recode",
									"redis",
									"Reflection",
									"regex",
									"rpminfo",
									"rrd",
									"SaxonC",
									"session",
									"shmop",
									"SimpleXML",
									"snmp",
									"soap",
									"sockets",
									"sodium",
									"solr",
									"SPL",
									"SplType",
									"SQLite",
									"sqlite3",
									"sqlsrv",
									"ssh2",
									"standard",
									"stats",
									"stomp",
									"suhosin",
									"superglobals",
									"svn",
									"sybase",
									"sync",
									"sysvmsg",
									"sysvsem",
									"sysvshm",
									"tidy",
									"tokenizer",
									"uopz",
									"uv",
									"v8js",
									"wddx",
									"win32service",
									"winbinder",
									"wincache",
									"wordpress",
									"xcache",
									"xdebug",
									"xhprof",
									"xml",
									"xmlreader",
									"xmlrpc",
									"xmlwriter",
									"xsl",
									"xxtea",
									"yaf",
									"yaml",
									"yar",
									"zend",
									"Zend OPcache",
									"ZendCache",
									"ZendDebugger",
									"ZendUtils",
									"zip",
									"zlib",
									"zmq",
									"zookeeper",
								},
								environment = {
									includePaths = {
										"/usr/include/php",
										"~/.composer/vendor",
									},
								},
							},
						},
					})
				end,
			},
		})
		vim.diagnostic.config({
			-- update_in_insert = true,
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
