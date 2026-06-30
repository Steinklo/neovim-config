# Neovim Config

Personal Neovim configuration built on **lazy.nvim** with LSP, Treesitter, and Telescope at the core.

## Structure

```
init.lua              → Entry point, loads core modules
lua/core/
  options.lua         → Editor settings (relative line numbers, 4-space indent, no wrap)
  keymaps.lua         → General keybindings (Space as leader)
  plugins.lua         → Plugin declarations (lazy.nvim)
  plugin_config/      → Per-plugin configuration
```

## Plugins

| Category | Plugins |
|----------|---------|
| LSP | nvim-lspconfig, mason, fidget, neodev, none-ls (prettier, stylua) |
| Completion | nvim-cmp, LuaSnip |
| Navigation | telescope (+ fzf), nvim-tree |
| Syntax | treesitter (+ textobjects) |
| Git | vim-fugitive, gitsigns |
| UI | gruvbox, lualine, which-key, indent-blankline |
| Editing | Comment.nvim |

## LSP Servers

`lua_ls` · `pyright` · `ts_ls` · `jsonls` · `yamlls`

Installed and managed automatically via Mason.

## Key Bindings

**Leader**: `Space` · **Local leader**: `,`

### General

| Key | Action |
|-----|--------|
| `<leader>s` | Find and replace word under cursor |
| `Shift+H/L` | Cycle buffers |
| `<leader>q` | Close buffer |
| `Ctrl+U/D` | Half-page scroll (centered) |

### Telescope

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Git files |
| `<leader>fi` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>?` | Recent files |
| `<leader>/` | Fuzzy search in buffer |

### LSP

| Key | Action |
|-----|--------|
| `gd` / `gD` | Go to definition / declaration |
| `gr` / `gi` | References / implementation |
| `K` | Hover docs |
| `<leader>r` | Rename |
| `<leader>ca` | Code action |
| `<leader>=` | Format buffer |
| `[g` / `]g` | Prev / next diagnostic |

### Treesitter Textobjects

| Key | Action |
|-----|--------|
| `af/if` | Select function (outer/inner) |
| `aa/ia` | Select parameter |
| `ac/ic` | Select class |
| `]m` / `[m` | Next / prev function |
| `<leader>a/A` | Swap parameter forward / back |

### Git & Files

| Key | Action |
|-----|--------|
| `<leader>gf` | Fugitive (git status) |
| `<leader>e` | Toggle file tree |

## Requirements

- Neovim ≥ 0.9
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- `ripgrep` for Telescope live grep
