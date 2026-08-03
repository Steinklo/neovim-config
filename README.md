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

### Telescope (find)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fi` | Find in files (grep) |
| `<leader>fr` | Find recent files |
| `<leader>/` | Search in current buffer |

### LSP

| Key | Action |
|-----|--------|
| `gd` / `gD` | Go to definition / declaration |
| `gr` / `gi` | References / implementation |
| `K` | Hover docs |
| `<leader>r` | Rename |
| `<leader>ca` | Code action |
| `<leader>=` | Format buffer |
| `<leader>do` | Open float diagnostic |
| `<leader>dl` | Diagnostics list |
| `[d` / `]d` | Prev / next diagnostic |

### Treesitter Textobjects

| Key | Action |
|-----|--------|
| `af/if` | Select function (outer/inner) |
| `aa/ia` | Select parameter |

### Files

| Key | Action |
|-----|--------|
| `<leader>e` | Open/focus file tree |

## Requirements

- Neovim ≥ 0.9
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- `ripgrep` for Telescope live grep
