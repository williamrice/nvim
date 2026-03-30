-- [ ~/.config/nvim/after/ftplugin/blade.lua ] --
vim.bo.smartindent = true
vim.bo.autoindent = true
vim.bo.indentexpr = "nvim_treesitter#indent()"
vim.treesitter.start()
