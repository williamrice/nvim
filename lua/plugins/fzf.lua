return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {
		lsp = {
			code_actions = {
				previewer = "codeaction_native",
				preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style=omit --file-style=omit",
			},
		},
	},
	config = function(_, _)
		require("fzf-lua").register_ui_select()
	end,
	---@diagnostic enable: missing-fields
}
