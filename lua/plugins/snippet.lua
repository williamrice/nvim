return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"mlaursen/vim-react-snippets",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		require("luasnip").config.setup({
			update_events = "TextChanged,TextChangedI",
			enable_autosnippets = true,
		})

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/lua/config/snippets" } })
		require("vim-react-snippets").lazy_load()

		require("luasnip").filetype_extend("javascript", { "react" })
		require("luasnip").filetype_extend("typescript", { "react" })
		require("luasnip").filetype_set("javascriptreact", { "react" })
		require("luasnip").filetype_set("typescriptreact", { "react" })
		require("luasnip").filetype_extend("php", { "html" })
		require("luasnip").filetype_extend("html", { "php" })
	end,
}
