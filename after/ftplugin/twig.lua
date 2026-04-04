vim.treesitter.start()
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.bo.indentexpr = "nvim_treesitter#indent()"
