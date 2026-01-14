-- Shared keymaps (work in both native Neovim and VSCode)

local keymap = vim.keymap

-- Note: jk -> ESC is configured in VSCode settings.json via compositeKeys for vscode-neovim
-- For native Neovim, it's in native/keymaps.lua

-- Delete character without affecting clipboard
keymap.set("n", "x", '"_x', { desc = "Delete character under cursor without affecting clipboard." })

-- Visual mode indentation (keep selection)
keymap.set("v", ">", ">gv", { desc = "Increase indentation." })
keymap.set("v", "<", "<gv", { desc = "Decrease indentation." })

-- Scroll with centering (doesn't work in VSCode but doesn't hurt)
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center cursor." })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center cursor." })

-- Search with centering (doesn't work in VSCode but doesn't hurt)
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center cursor." })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center cursor." })
