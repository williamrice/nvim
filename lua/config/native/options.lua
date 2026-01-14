-- Native Neovim only options
-- (Shared options are in config/shared/options.lua)

local g = vim.g
local opt = vim.opt

-- Disable netrw (using neo-tree instead)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Encoding
opt.encoding = "UTF-8"

-- Clipboard is in shared/options.lua

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Scrolling
opt.scrolloff = 15

-- Behavior
opt.errorbells = false
opt.wrap = false

-- UI settings (VSCode handles these, so native-only)
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
--opt.colorcolumn = "100"
opt.showmode = false
opt.signcolumn = "yes"
opt.list = false
opt.cmdheight = 1
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
