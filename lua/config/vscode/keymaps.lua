-- VSCode-specific keymaps using VSCode API
-- These replicate the native keymaps but use VSCode actions

local vscode = require("vscode")
local keymap = vim.keymap

-- ============================================================================
-- General Keymaps
-- ============================================================================

-- Note: jk -> ESC is configured in VSCode settings.json via compositeKeys
-- Note: x -> "_x is in shared (works in both)
-- Note: Visual mode >, < indentation is in shared (works in both)

-- Save without formatting
keymap.set("n", "<leader>sf", function()
	vscode.action("workbench.action.files.save")
end, { desc = "Saves the buffer without formatting." })

-- Double escape to close sidebar
keymap.set("n", "<Esc><Esc>", function()
	vscode.action("workbench.action.closeSidebar")
end, { desc = "Close primary sidebar." })

-- Note: <C-d>, <C-u> scroll with center should work in shared
-- Note: n, N search with center should work in shared

-- Source file not needed in VSCode (removed <leader><leader>)

-- ===========================================================================
-- Window/Split Management (VSCode Editor Groups)
-- ============================================================================

-- Split windows
keymap.set("n", "<leader>sv", function()
	vscode.action("workbench.action.splitEditorRight")
end, { desc = "Split window vertically." })

keymap.set("n", "<leader>sh", function()
	vscode.action("workbench.action.splitEditorDown")
end, { desc = "Split window horizontally." })

keymap.set("n", "<leader>se", function()
	vscode.action("workbench.action.evenEditorWidths")
end, { desc = "Equalize window sizes." })

keymap.set("n", "<leader>sx", function()
	vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close current window." })

-- Tabs (Editor Groups in VSCode)
keymap.set("n", "<leader>to", function()
	vscode.action("workbench.action.files.newUntitledFile")
end, { desc = "Open new tab." })

keymap.set("n", "<leader>tx", function()
	vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close current tab." })

-- ============================================================================
-- Pane Navigation
-- ============================================================================

keymap.set("n", "<C-h>", function()
	vscode.action("workbench.action.navigateLeft")
end, { desc = "Navigate to left pane." })

keymap.set("n", "<C-j>", function()
	vscode.action("workbench.action.navigateDown")
end, { desc = "Navigate to pane below." })

keymap.set("n", "<C-k>", function()
	vscode.action("workbench.action.navigateUp")
end, { desc = "Navigate to pane above." })

keymap.set("n", "<C-l>", function()
	vscode.action("workbench.action.navigateRight")
end, { desc = "Navigate to right pane." })

-- ============================================================================
-- Debugging (VSCode has built-in debugger, using VSCode actions)
-- ============================================================================

keymap.set("n", "<F5>", function()
	vscode.action("workbench.action.debug.continue")
end, { desc = "Debug: Continue/Start" })

keymap.set("n", "<F10>", function()
	vscode.action("workbench.action.debug.stepOver")
end, { desc = "Debug: Step Over" })

keymap.set("n", "<F11>", function()
	vscode.action("workbench.action.debug.stepInto")
end, { desc = "Debug: Step Into" })

keymap.set("n", "<F12>", function()
	vscode.action("workbench.action.debug.stepOut")
end, { desc = "Debug: Step Out" })

keymap.set("n", "<leader>db", function()
	vscode.action("editor.debug.action.toggleBreakpoint")
end, { desc = "Toggle breakpoint" })

keymap.set("n", "<leader>dt", function()
	vscode.action("workbench.action.debug.stop")
end, { desc = "Debug: Stop" })

keymap.set("n", "<leader>dr", function()
	vscode.action("workbench.action.debug.restart")
end, { desc = "Debug: Restart" })

-- Run to cursor
keymap.set("n", "<leader>dc", function()
	vscode.action("debug.runToCursor")
end, { desc = "Run to cursor" })

-- ============================================================================
-- Copilot (VSCode Extension)
-- ============================================================================

-- Toggle Copilot completions
keymap.set("n", "<leader>ct", function()
	vscode.action("github.copilot.completions.toggle")
end, { desc = "Toggle Copilot completions." })

-- Open Copilot Chat panel
keymap.set("n", "<leader>cp", function()
	vscode.action("workbench.action.chat.open")
end, { desc = "Open Copilot chat panel." })

-- Open inline chat (works in normal and visual mode for context)
keymap.set({ "n", "v" }, "<leader>ci", function()
	vscode.action("inlineChat.start")
end, { desc = "Start inline Copilot chat." })

-- ============================================================================
-- LSP Actions (VSCode handles LSP natively)
-- ============================================================================

-- Navigation
keymap.set("n", "<leader>gs", function()
	vscode.action("editor.action.goToDeclaration")
end, { desc = "Go to declaration." })

keymap.set("n", "<leader>gd", function()
	vscode.action("editor.action.revealDefinition")
end, { desc = "Go to definition." })

keymap.set("n", "<leader>gp", function()
	vscode.action("editor.action.peekDefinition")
end, { desc = "Peek definition." })

keymap.set("n", "<leader>gi", function()
	vscode.action("editor.action.goToImplementation")
end, { desc = "Go to implementation." })

keymap.set("n", "<leader>gr", function()
	vscode.action("editor.action.goToReferences")
end, { desc = "Show references." })

-- TypeScript specific - Go to source definition
keymap.set("n", "<leader>gts", function()
	vscode.action("typescript.goToSourceDefinition")
end, { desc = "Go to source definition (TypeScript)." })

-- Hover documentation
keymap.set("n", "K", function()
	vscode.action("editor.action.showHover")
end, { desc = "Hover documentation." })

-- Show line diagnostics
keymap.set("n", "<leader>ge", function()
	vscode.action("editor.action.showHover")
end, { desc = "Show line diagnostics." })

-- Diagnostics navigation
keymap.set("n", "[d", function()
	vscode.action("editor.action.marker.prev")
end, { desc = "Previous diagnostic." })

keymap.set("n", "]d", function()
	vscode.action("editor.action.marker.next")
end, { desc = "Next diagnostic." })

-- ============================================================================
-- Formatting
-- ============================================================================

keymap.set({ "n", "v" }, "<leader>f", function()
	vscode.action("editor.action.formatDocument")
end, { desc = "Format file or range (in visual mode)." })

-- ============================================================================
-- Trouble (Diagnostics/Problems in VSCode)
-- ============================================================================

keymap.set("n", "<leader>xx", function()
	vscode.action("workbench.actions.view.problems")
end, { desc = "Toggle diagnostics (Problems)." })

keymap.set("n", "<leader>xX", function()
	vscode.action("workbench.actions.view.problems")
end, { desc = "Toggle buffer diagnostics (Problems)." })

keymap.set("n", "<leader>xs", function()
	vscode.action("workbench.action.gotoSymbol")
end, { desc = "Toggle symbols (Outline)." })

keymap.set("n", "<leader>xl", function()
	vscode.action("references-view.findReferences")
end, { desc = "Toggle LSP definitions/references." })

keymap.set("n", "<leader>xL", function()
	vscode.action("workbench.actions.view.problems")
end, { desc = "Toggle location list (Problems)." })

keymap.set("n", "<leader>xq", function()
	vscode.action("workbench.actions.view.problems")
end, { desc = "Toggle quickfix list (Problems)." })

-- ============================================================================
-- Spectre (Search/Replace - VSCode has built-in)
-- ============================================================================

keymap.set("n", "<leader>S", function()
	vscode.action("workbench.action.replaceInFiles")
end, { desc = "Toggle Search/Replace (Spectre equivalent)" })

keymap.set("n", "<leader>sw", function()
	vscode.action("workbench.action.findInFiles", {
		args = { query = vim.fn.expand("<cword>") },
	})
end, { desc = "Search current word" })

keymap.set("v", "<leader>sw", function()
	vscode.action("workbench.action.findInFiles")
end, { desc = "Search current selection" })

keymap.set("n", "<leader>sp", function()
	vscode.action("workbench.action.findInFiles", {
		args = {
			query = vim.fn.expand("<cword>"),
			filesToInclude = vim.fn.expand("%:p"),
		},
	})
end, { desc = "Search on current file" })

-- ============================================================================
-- File Explorer (Neo-tree equivalent)
-- ============================================================================

keymap.set("n", "<leader>e", function()
	vscode.action("workbench.view.explorer")
end, { desc = "Toggle file explorer." })

-- ============================================================================
-- Telescope (VSCode Quick Open/Search equivalents)
-- ============================================================================

keymap.set("n", "<leader>ff", function()
	vscode.action("workbench.action.quickOpen")
end, { desc = "Find files in current directory." })

keymap.set("n", "<leader>fs", function()
	vscode.action("workbench.action.findInFiles")
end, { desc = "Search string in current directory." })

-- Find in buffer (Cmd+F style search bar, auto-uses selection in visual mode)
keymap.set({ "n", "v" }, "<leader>fb", function()
	vscode.action("actions.find")
end, { desc = "Find in current buffer." })

-- Search word under cursor in all files
keymap.set("n", "<leader>fw", function()
	vscode.action("workbench.action.findInFiles", {
		args = { query = vim.fn.expand("<cword>") },
	})
end, { desc = "Search word under cursor in files." })

-- Find config files (VSCode settings)
keymap.set("n", "<leader>fc", function()
	vscode.action("workbench.action.openSettingsJson")
end, { desc = "Open VSCode settings." })

keymap.set("n", "<leader>fr", function()
	vscode.action("workbench.action.openRecent")
end, { desc = "List recently opened files." })

keymap.set("n", "<leader>km", function()
	vscode.action("workbench.action.openGlobalKeybindings")
end, { desc = "List keymappings." })

keymap.set("n", "<leader>fg", function()
	vscode.action("workbench.action.findInFiles")
end, { desc = "Fuzzy grep in files" })

-- ============================================================================
-- Git Commands
-- ============================================================================

keymap.set("n", "<leader>gb", function()
	vscode.action("gitlens.toggleLineBlame")
end, { desc = "Toggle Git blame view." })

-- DiffView equivalents
keymap.set("n", "<leader>gv", function()
	vscode.action("workbench.view.scm")
end, { desc = "Open Git source control view." })

keymap.set("n", "<leader>gh", function()
	vscode.action("gitlens.showQuickFileHistory")
end, { desc = "Open Git history for current file." })

keymap.set("n", "<leader>gf", function()
	vscode.action("gitlens.showQuickFileHistory")
end, { desc = "Open Git history for current file." })

keymap.set("n", "<leader>gc", function()
	vscode.action("gitlens.compareWith")
end, { desc = "Compare Git branches/commits." })

keymap.set("n", "<leader>gx", function()
	vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close Git diff view." })

-- ============================================================================
-- Buffer Management (BufferLine equivalent)
-- ============================================================================

keymap.set("n", "<leader>q", function()
	vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close current buffer." })

-- Buffer picker (quick open editor)
keymap.set("n", "<leader>tp", function()
	vscode.action("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
end, { desc = "Pick a buffer to switch to." })

keymap.set("n", "<leader>tc", function()
	vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Pick a buffer to close." })

-- Shift+L/H for next/previous buffer
keymap.set("n", "<S-l>", function()
	vscode.action("workbench.action.nextEditor")
end, { desc = "Go to next buffer." })

keymap.set("n", "<S-h>", function()
	vscode.action("workbench.action.previousEditor")
end, { desc = "Go to previous buffer." })

-- Move editor (Shift+Arrow)
keymap.set("n", "<S-Right>", function()
	vscode.action("workbench.action.moveEditorRightInGroup")
end, { desc = "Move buffer to next position." })

keymap.set("n", "<S-Left>", function()
	vscode.action("workbench.action.moveEditorLeftInGroup")
end, { desc = "Move buffer to previous position." })

-- ============================================================================
-- Additional VSCode-Specific Useful Keymaps
-- ============================================================================

-- Show all commands
keymap.set("n", "<leader><leader>", function()
	vscode.action("workbench.action.showCommands")
end, { desc = "Show command palette." })

-- Quick fix / code actions
keymap.set("n", "<leader>ca", function()
	vscode.action("editor.action.quickFix")
end, { desc = "Show code actions." })

-- Rename symbol
keymap.set("n", "<leader>rn", function()
	vscode.action("editor.action.rename")
end, { desc = "Rename symbol." })

-- HTML Tag Wrap (extension: htmltagwrap by Brad Gashler)
keymap.set("v", "<leader>wt", function()
	vscode.action("extension.htmlTagWrap")
end, { desc = "Wrap selection in HTML tag." })
