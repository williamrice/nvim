local keymap = vim.keymap
local conform = require("conform")

-- general keymaps
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")

keymap.set("n", "<leader>-", "<C-x>")

-- Split windows keys
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Pane swaps
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to Left Pane." })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate Down a Pane." })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate Up a Pane." })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to Right Pane." })

----------------------
-- Plugin Keybinds
----------------------
--lsp
keymap.set("n", "<leader>gs", "<cmd>TSToolsGoToSourceDefinition<cr>", {desc = "Goes to source definition"})

-- conform formatter
keymap.set({ "n", "v" }, "<leader>f", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<cr>") -- list keymapping

-- telescope git commands
keymap.set( "n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Git Blame View." })

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- bufferline
keymap.set("n", "<leader>q", ":bd<CR>")
keymap.set("n", "tp", "<CMD>BufferLinePick<CR>")
keymap.set("n", "<leader>tc", "<CMD>BufferLinePickClose<CR>")
keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>")
keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>")
keymap.set("n", "<S-]>", "<CMD>BufferLineMoveNext<CR>")
keymap.set("n", "<S-[>", "<CMD>BufferLineMovePrev<CR>")
keymap.set("n", "ts", "<CMD>BufferLineSortByDirectory<CR>")
