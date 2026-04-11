local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim',       opts = {} },
      'folke/neodev.nvim',
    },
  },

  -- LaTeX
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
    end,
  },

  -- Formatters / linters (LSP keymaps are attached via LspAttach in lsp.lua)
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local none_ls = require('null-ls')
      none_ls.setup({
        sources = {
          none_ls.builtins.formatting.prettier,
          none_ls.builtins.formatting.stylua,
        },
      })
    end,
  },

  -- Filetree
  'nvim-tree/nvim-tree.lua',

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
    },
  },

  -- Terminal
  'akinsho/nvim-toggleterm.lua',

  -- Markdown preview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  -- Pending-keybind hints
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  -- Git signs in the gutter
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
          { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = '[H]unk [P]review' })
      end,
    },
  },

  -- Theme
  { 'ellisonleao/gruvbox.nvim',            priority = 1000, config = true },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Indent guides
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl',    opts = {} },

  -- "gc" to comment lines
  { 'numToStr/Comment.nvim',               opts = {} },

  -- Fuzzy finder
  { 'nvim-telescope/telescope.nvim',       branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable('make') == 1
    end,
  },

  -- Treesitter (v1.0 / main branch).
  -- Pinned to the last commit that supports Nvim 0.11 (current stable).
  -- The next upstream commit (c82bf96f) requires 0.12+. Drop this pin
  -- once Nvim 0.12 is released and installed.
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    commit = '90cd6580',
    lazy = false,
    build = function()
      require('nvim-treesitter').update()
    end,
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
    },
  },
}, {})
