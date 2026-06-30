-- LSP keymaps are set on LspAttach so they apply to every server
-- (including none-ls) without each server registering them itself.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true }),
  callback = function(event)
    local bufnr = event.buf
    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
    end

    nmap('<leader>r',  vim.lsp.buf.rename,                          'Rename')
    nmap('<leader>ca', vim.lsp.buf.code_action,                     'Code action')

    nmap('gd',         vim.lsp.buf.definition,                      'Goto definition')
    nmap('gD',         vim.lsp.buf.declaration,                     'Goto declaration')
    nmap('gr',         require('telescope.builtin').lsp_references, 'Goto references')
    nmap('gi',         vim.lsp.buf.implementation,                  'Goto implementation')

    nmap('K',          vim.lsp.buf.hover,                           'Hover documentation')
    nmap('<C-k>',      vim.lsp.buf.signature_help,                  'Signature help')

    vim.keymap.set('n', '<leader>=', function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = bufnr, desc = 'LSP: Format buffer' })
  end,
})

-- Diagnostics keymaps (global, not buffer-scoped)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end,
  { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end,
  { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, { desc = 'Open float diagnostic' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Diagnostics list' })

-- Better Lua LSP experience when editing Neovim config
require('neodev').setup()

-- Broadcast nvim-cmp capabilities to every server
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', { capabilities = capabilities })

-- Per-server overrides
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

-- Install and enable servers via mason-lspconfig
local servers = {
  'lua_ls',
  'pyright',
  'ts_ls',
  'jsonls',
  'yamlls',
}

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = servers,
  automatic_enable = true,
})

-- nvim-cmp setup
local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup({})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>']     = cmp.mapping.select_next_item(),
    ['<C-p>']     = cmp.mapping.select_prev_item(),
    ['<C-d>']     = cmp.mapping.scroll_docs(-4),
    ['<C-f>']     = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete({}),
    ['<CR>']      = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})
