-- Shared autocmds (work in both native Neovim and VSCode)

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("warice_highlight_yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
