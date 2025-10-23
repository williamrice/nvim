# Neovim Configuration

A modern, feature-rich Neovim configuration optimized for full-stack web development with support for PHP, TypeScript/JavaScript, Python, C#, and more.

## Features

- **LSP Support**: Comprehensive language server support via `nvim-lspconfig` and Mason
- **Auto-completion**: Intelligent code completion with `nvim-cmp` and snippets
- **Debugging**: Full DAP (Debug Adapter Protocol) integration with UI
- **Git Integration**: GitBlame, Gitsigns, and LazyGit for version control
- **Fuzzy Finding**: Telescope with FZF native sorter for fast file/text searching
- **Syntax Highlighting**: Tree-sitter for better syntax highlighting and code understanding
- **Code Formatting**: Conform.nvim with auto-format on save
- **File Explorer**: Neo-tree for file navigation
- **Which-Key**: Keymap discovery and documentation
- **AI Assistance**: GitHub Copilot integration

## Requirements

- Neovim >= 0.9.0 (includes native EditorConfig support)
- Git
- A Nerd Font (for icons)
- `make` (for telescope-fzf-native)
- Node.js (for some LSP servers)
- Python 3 (for some LSP servers)

### Optional Dependencies

- `ripgrep` - for better grep performance
- `fd` - for better file finding

**Optional formatters** (install manually or via Mason as needed):
- `prettier` - JavaScript/TypeScript/CSS/HTML/JSON formatting
- `stylua` - Lua formatting
- `black`, `isort` - Python formatting
- `shfmt` - Shell script formatting

## Installation

1. **Backup your existing Neovim configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

   Lazy.nvim will automatically install all plugins on first launch.

4. **Install LSP servers**:
   - Open Neovim and run `:Mason`
   - LSP servers listed in the config will auto-install
   - Optionally install formatters via Mason (prettier, stylua, black, isort, shfmt) or your system package manager

## Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── init.lua           # Bootstrap lazy.nvim
│   │   ├── options.lua        # Neovim options
│   │   ├── keymap.lua         # General keymaps
│   │   ├── autocmds.lua       # Autocommands
│   │   ├── php-settings.lua   # PHP LSP configuration
│   │   └── snippets/          # Custom snippets
│   └── plugins/               # Plugin configurations
│       ├── lsp.lua            # LSP setup
│       ├── cmp.lua            # Completion
│       ├── telescope.lua      # Fuzzy finder
│       ├── treesitter.lua     # Syntax highlighting
│       ├── dap.lua            # Debugging
│       ├── formatter.lua      # Code formatting
│       └── ...                # Other plugins
└── README.md
```

## Key Mappings

Leader key: `Space`

### General

| Key | Mode | Description |
|-----|------|-------------|
| `jk` | Insert | Exit insert mode |
| `<leader>nh` | Normal | Clear search highlights |
| `<leader>sf` | Normal | Save without formatting |
| `<leader>f` | Normal/Visual | Format file or selection |
| `<C-g>` | Normal | Select all |
| `<C-d>` / `<C-u>` | Normal | Scroll down/up (centered) |

### Window Management

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>sv` | Normal | Split window vertically |
| `<leader>sh` | Normal | Split window horizontally |
| `<leader>se` | Normal | Equalize window sizes |
| `<leader>sx` | Normal | Close current window |
| `<C-h/j/k/l>` | Normal | Navigate between windows |

### Tabs & Buffers

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>to` | Normal | Open new tab |
| `<leader>tx` | Normal | Close current tab |
| `<leader>tn/tp` | Normal | Next/previous tab |
| `<S-l>` / `<S-h>` | Normal | Cycle buffers |
| `<leader>q` | Normal | Close current buffer |

### File Explorer (Neo-tree)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>e` | Normal | Toggle file explorer |

### Telescope (Find)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ff` | Normal | Find files |
| `<leader>fs` | Normal | Live grep (search text) |
| `<leader>fb` | Normal | Grep string under cursor |
| `<leader>fc` | Normal | Browse Neovim config files |
| `<leader>fr` | Normal | Recent files |
| `<leader>fh` | Normal | Help tags |
| `<leader>km` | Normal | Show keymaps |

### LSP

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gd` | Normal | Go to definition |
| `<leader>gs` | Normal | Go to declaration |
| `<leader>gi` | Normal | Go to implementation |
| `<leader>gr` | Normal | Show references |
| `<leader>ca` | Normal/Visual | Code action |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ge` | Normal | Show diagnostics |
| `K` | Normal | Hover documentation |
| `[d` / `]d` | Normal | Previous/next diagnostic |

### Debugging (DAP)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>db` | Normal | Toggle breakpoint |
| `<leader>dc` | Normal | Run to cursor |
| `<leader>du` | Normal | Toggle DAP UI |
| `<F1>` | Normal | Continue |
| `<F2>` | Normal | Step into |
| `<F3>` | Normal | Step over |
| `<F4>` | Normal | Step out |
| `<F5>` | Normal | Step back |
| `<leader>dr` | Normal | Restart |

### Git

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gb` | Normal | Toggle Git blame |

### Diagnostics (Trouble)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>xx` | Normal | Toggle diagnostics |
| `<leader>xX` | Normal | Toggle buffer diagnostics |
| `<leader>xs` | Normal | Toggle symbols |
| `<leader>xl` | Normal | Toggle LSP definitions |

### Copilot

| Key | Mode | Description |
|-----|------|-------------|
| `<C-\>` | Insert/Normal | Toggle Copilot |

### Which-Key

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>wk` | Normal | Show buffer-local keymaps |

Press `<leader>` and wait to see available keymaps grouped by category automatically.

## Supported Languages

### Fully Configured

- **PHP** - Intelephense with WordPress stubs and automatic composer global vendor detection
  - Automatically detects composer stubs in `~/.composer/vendor/` or `~/.config/composer/vendor/`
  - Respects `COMPOSER_HOME` environment variable if set
  - Works across macOS and Linux
- **JavaScript/TypeScript** - TypeScript LSP, Prettier formatting
- **React/JSX/TSX** - Full support with snippets
- **Python** - Pyright LSP, Black + isort formatting
- **Lua** - lua_ls with Neovim config awareness, Stylua formatting
- **C#** - Roslyn LSP with inlay hints
- **Astro** - LSP and Prettier support
- **HTML/CSS** - LSP and Prettier support
- **Docker** - Dockerfile and docker-compose LSP
- **Prisma** - Schema support

### Tree-sitter Parsers Installed

Bash, C, C#, CSS, Dockerfile, Elixir, HTML, JavaScript, JSON, Lua, Markdown, PHP, TypeScript, YAML, and more.

## PHP Development Setup

### Installing Composer Stubs Globally

To get enhanced PHP autocomplete for frameworks and libraries, install stubs globally with composer:

```bash
# Install commonly used stubs
composer global require php-stubs/wordpress-stubs
composer global require php-stubs/woocommerce-stubs
composer global require php-stubs/acf-pro-stubs
# Add any other stubs you need
```

The configuration automatically detects composer global installations in:
- `$COMPOSER_HOME/vendor/` (if COMPOSER_HOME is set)
- `~/.composer/vendor/` (default on many systems)
- `~/.config/composer/vendor/` (XDG standard)

No configuration changes needed - it works automatically on both macOS and Linux!

## Customization

### Adding a Language Server

1. Edit `lua/plugins/lsp.lua`
2. Add server to `ensure_installed` list
3. Configure server settings if needed
4. Enable the server with `vim.lsp.enable("server_name")`

### Adding a Formatter

1. Edit `lua/plugins/formatter.lua`
2. Add filetype and formatter to `formatters_by_ft`
3. Install formatter via Mason or system package manager

### Adding Custom Keymaps

Edit `lua/config/keymap.lua` and add your keymaps:

```lua
vim.keymap.set("n", "<leader>custom", "<cmd>MyCommand<cr>", { desc = "My custom command" })
```

### Adding a Plugin

Create a new file in `lua/plugins/` (e.g., `lua/plugins/myplugin.lua`):

```lua
return {
  "author/plugin-name",
  event = "VeryLazy",  -- or other lazy-loading trigger
  opts = {
    -- plugin options
  },
}
```

## Troubleshooting

### LSP not working

1. Check if the LSP server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Check logs: `:lua vim.cmd('e'..vim.lsp.get_log_path())`

### Formatting not working

1. Ensure formatter is installed (check Mason or system)
2. Check conform status: `:ConformInfo`
3. Verify filetype mapping in `lua/plugins/formatter.lua`

### Treesitter errors

1. Update parsers: `:TSUpdate`
2. Check installed parsers: `:TSInstallInfo`

### Telescope not finding files

1. Ensure `ripgrep` and `fd` are installed
2. Check if you're in a git repository (some searches are git-aware)

## Performance

This config is optimized for performance with:

- Lazy loading for most plugins
- Tree-sitter for efficient syntax highlighting
- FZF native sorter for Telescope
- Minimal startup time (~50-100ms on modern hardware)

## Credits

Built with:

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configurations
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- And many more amazing plugins!

## License

This configuration is free to use and modify for personal use.
