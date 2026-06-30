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
  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim',       opts = {} },
      'folke/neodev.nvim',
    },
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

  -- Pending-keybind hints
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
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
  { 'nvim-telescope/telescope.nvim',       dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable('make') == 1
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = function()
      require('nvim-treesitter').update()
    end,
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
    },
  },
}, {})
