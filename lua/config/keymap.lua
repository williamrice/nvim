local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode." })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights." })
keymap.set("n", "<leader>sf", ":noa w<CR>", { desc = "Saves the buffer without formatting." })
keymap.set("n", "x", '"_x', { desc = "Delete character under cursor without affecting clipboard." })
keymap.set("n", "<leader>=", "<C-a>", { desc = "Increment number under cursor." })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number under cursor." })
keymap.set("v", ">", ">gv", { desc = "Increase indentation." })
keymap.set("v", "<", "<gv", { desc = "Decrease indentation." })
keymap.set("n", "<C-g>", "ggVG", { desc = "Select all text in buffer." })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center cursor." })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center cursor." })
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center cursor." })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center cursor." })
keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
	print("Sourced the current file.")
end, { desc = "Source the current file." })

-- Split windows keys
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically." })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally." })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize window sizes." })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current window." })

keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab." })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab." })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab." })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab." })

-- Pane swaps
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to left pane." })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to pane below." })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate to pane above." })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to right pane." })

-- Debugging Keymaps (loaded lazily when DAP is available)
local dap_ok, dap = pcall(require, "dap")
if dap_ok then
	keymap.set("n", "<F5>", dap.continue, { desc = "DAP continue / start debugging" })
	keymap.set("n", "<F10>", dap.step_over, { desc = "DAP step over" })
	keymap.set("n", "<F11>", dap.step_into, { desc = "DAP step into" })
	keymap.set("n", "<F12>", dap.step_out, { desc = "DAP step out" })
	keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
	keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP terminate / stop debugging" })
	keymap.set("n", "<leader>dr", dap.restart, { desc = "DAP restart" })
	keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "Run to cursor" })
end

-- run lua server
vim.keymap.set("n", "<leader>dl", function()
	require("osv").launch({ port = 8086 })
end, { noremap = true, desc = "Launch Lua debug server" })

-- Eval var under cursor
keymap.set("n", "<leader>?", function()
	local dapui_ok, dapui = pcall(require, "dapui")
	if dapui_ok then
		--- @diagnostic disable-next-line: missing-fields
		dapui.eval(nil, { enter = true })
	end
end, { desc = "Evaluate variable under cursor" })

keymap.set("n", "<leader>du", function()
	local dapui_ok, dapui = pcall(require, "dapui")
	if dapui_ok then
		dapui.toggle()
	end
end, { desc = "Toggle DAP UI" })

-- Plugin Keybinds
----------------------
-- Code copy
keymap.set("n", "<leader>cr", "<CMD>Lazy reload codecopy.nvim<CR>", { desc = "reload code copy" })
keymap.set("n", "<leader>cc", "<CMD>CodeCopy<CR>", { desc = "copy code" })

-- copilot
keymap.set({ "i", "n" }, "<C-Bslash>", function()
	if vim.b.copilot_enabled == nil then
		vim.b.copilot_enabled = true
	end
	vim.b.copilot_enabled = not vim.b.copilot_enabled
	vim.print("Copilot enabled: " .. tostring(vim.b.copilot_enabled))
end, { desc = "Toggle co-pilot." })

-- lsp
keymap.set(
	"n",
	"<leader>gts",
	"<cmd>TSToolsGoToSourceDefinition<cr>",
	{ desc = "Go to source definition in TypeScript file." }
)
keymap.set("n", "<leader>ge", vim.diagnostic.open_float, { desc = "Show line diagnostics." })

-- conform formatter
keymap.set({ "n", "v" }, "<leader>f", function()
	local conform_ok, conform = pcall(require, "conform")
	if conform_ok then
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		})
	end
end, { desc = "Format file or range (in visual mode)." })

-- trouble
keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle diagnostics (Trouble)." })
keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Toggle buffer diagnostics (Trouble)." }
)
keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Toggle symbols (Trouble)." })
keymap.set(
	"n",
	"<leader>xl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "Toggle LSP definitions/references (Trouble)." }
)
keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Toggle location list (Trouble)." })
keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Toggle quickfix list (Trouble)." })

-- spectre
keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer." })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files in current directory." })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Search string in current directory." })
keymap.set("n", "<leader>fb", "<cmd>Telescope grep_string<cr>", { desc = "Search string under cursor." })
keymap.set("n", "<leader>fc", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "List Neovim config files." })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "List recently opened files." })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "List available help tags." })
keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<cr>", { desc = "List keymappings." })
local fuzzy_search = function()
	require("telescope.builtin").grep_string({
		shorten_path = true,
		word_match = "-w",
		only_sort_text = true,
		search = "",
	})
end
vim.keymap.set("n", "<leader>fg", fuzzy_search, { desc = "Telescope fuzzy Grep" })

-- git commands
keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Git blame view." })

-- diffview
keymap.set("n", "<leader>gv", "<cmd>DiffviewOpen<cr>", { desc = "Open Git diff view." })
keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", { desc = "Open Git history for all files." })
keymap.set("n", "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", { desc = "Open Git history for current file." })
keymap.set("n", "<leader>gc", function()
	vim.ui.input({ prompt = "Compare branch/commit: " }, function(input)
		if input then
			vim.cmd("DiffviewOpen " .. input)
		end
	end)
end, { desc = "Compare Git branches/commits." })
keymap.set("n", "<leader>gx", "<cmd>DiffviewClose<cr>", { desc = "Close Git diff view." })

-- bufferline
keymap.set("n", "<leader>q", "<cmd>bp|bd #<CR>", { desc = "Close current buffer." })
keymap.set("n", "<leader>tp", "<CMD>BufferLinePick<CR>", { desc = "Pick a buffer to switch to." })
keymap.set("n", "<leader>tc", "<CMD>BufferLinePickClose<CR>", { desc = "Pick a buffer to close." })
keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", { desc = "Go to next buffer." })
keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer." })
keymap.set("n", "<S-Right>", "<CMD>BufferLineMoveNext<CR>", { desc = "Move buffer to next position." })
keymap.set("n", "<S-Left>", "<CMD>BufferLineMovePrev<CR>", { desc = "Move buffer to previous position." })
keymap.set("n", "<leader>ts", "<CMD>BufferLineSortByDirectory<CR>", { desc = "Sort buffers by directory." })

-- package json info
keymap.set(
	{ "n" },
	"<leader>ns",
	require("package-info").show,
	{ silent = true, noremap = true, desc = "Show dependency versions." }
)
keymap.set(
	{ "n" },
	"<leader>nc",
	require("package-info").hide,
	{ silent = true, noremap = true, desc = "Hide dependency versions." }
)
keymap.set(
	{ "n" },
	"<leader>nt",
	require("package-info").toggle,
	{ silent = true, noremap = true, desc = "Toggle dependency versions." }
)
keymap.set(
	{ "n" },
	"<leader>nu",
	require("package-info").update,
	{ silent = true, noremap = true, desc = "Update dependency on the line." }
)
keymap.set(
	{ "n" },
	"<leader>nd",
	require("package-info").delete,
	{ silent = true, noremap = true, desc = "Delete dependency on the line." }
)
keymap.set(
	{ "n" },
	"<leader>ni",
	require("package-info").install,
	{ silent = true, noremap = true, desc = "Install a new dependency." }
)
keymap.set(
	{ "n" },
	"<leader>np",
	require("package-info").change_version,
	{ silent = true, noremap = true, desc = "Install a different dependency version." }
)
