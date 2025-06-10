local keymap = vim.keymap
local conform = require("conform")

-- general keymaps
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>sf", ":noa w<CR>", { desc = "Saves the buffer without formatting" })

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>=", "<C-a>")

keymap.set("n", "<leader>-", "<C-x>")
keymap.set("v", ">", ">gv", { desc = "Increase Indentation." })
keymap.set("v", "<", "<gv", { desc = "Decrease Indentation." })
keymap.set("n", "<C-g>", "ggVG", { desc = "Select All." })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down and Center." })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up and Center." })

keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
	print("Sourced the current file.")
end)

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
-- Code copy
keymap.set({ "i", "n" }, "<C-Bslash>", function()
	if vim.b.copilot_enabled == nil then
		vim.b.copilot_enabled = true
	end

	vim.b.copilot_enabled = not vim.b.copilot_enabled

	vim.print("Copilot enabled: " .. tostring(vim.b.copilot_enabled))
end, { desc = "Toggle copilot" })
--lsp
keymap.set(
	"n",
	"<leader>gts",
	"<cmd>TSToolsGoToSourceDefinition<cr>",
	{ desc = "Goes to source definition in typescript file" }
)
keymap.set("n", "<leader>ge", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
-- conform formatter
keymap.set({ "n", "v" }, "<leader>f", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })
-- trouble
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fb", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fc", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
end) -- list all neovim config files for easy reference / edit
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>") -- list recently opened files
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<cr>") -- list keymapping

-- telescope git commands
keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Git Blame View." })

-- bufferline
keymap.set("n", "<leader>q", "<cmd>bp|bd #<CR>")
keymap.set("n", "<leader>tp", "<CMD>BufferLinePick<CR>")
keymap.set("n", "<leader>tc", "<CMD>BufferLinePickClose<CR>")
keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>")
keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>")
keymap.set("n", "<S-]>", "<CMD>BufferLineMoveNext<CR>")
keymap.set("n", "<S-[>", "<CMD>BufferLineMovePrev<CR>")
keymap.set("n", "<leader>ts", "<CMD>BufferLineSortByDirectory<CR>")

-- package json info
-- Show dependency versions
keymap.set({ "n" }, "<leader>ns", require("package-info").show, { silent = true, noremap = true })

-- Hide dependency versions
keymap.set({ "n" }, "<leader>nc", require("package-info").hide, { silent = true, noremap = true })

-- Toggle dependency versions
keymap.set({ "n" }, "<leader>nt", require("package-info").toggle, { silent = true, noremap = true })

-- Update dependency on the line
keymap.set({ "n" }, "<leader>nu", require("package-info").update, { silent = true, noremap = true })

-- Delete dependency on the line
keymap.set({ "n" }, "<leader>nd", require("package-info").delete, { silent = true, noremap = true })

-- Install a new dependency
keymap.set({ "n" }, "<leader>ni", require("package-info").install, { silent = true, noremap = true })

-- Install a different dependency version
keymap.set({ "n" }, "<leader>np", require("package-info").change_version, { silent = true, noremap = true })
