-- Shared options (work in both native Neovim and VSCode)

-- CRITICAL: Leader keys MUST be set before any keymaps load
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic editing settings
vim.opt.mouse = "a"
vim.opt.backspace = "indent,eol,start"
vim.opt.iskeyword:append("-")

-- Clipboard integration (system clipboard)
vim.opt.clipboard = "unnamedplus"

-- Search settings
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Undo and timing
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 5000

-- Tab settings (consistent indentation across both)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.autoindent = true

-- Behavior
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
