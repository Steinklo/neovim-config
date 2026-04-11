-- LSP keymaps are set on LspAttach so they apply to every server
-- (including none-ls) without each server registering them itself.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true }),
  callback = function(event)
    local bufnr = event.buf
    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
    end

    nmap('<leader>r',  vim.lsp.buf.rename,                             '[R]ename')
    nmap('<leader>ca', vim.lsp.buf.code_action,                        '[C]ode [A]ction')

    nmap('gd',         vim.lsp.buf.definition,                         '[G]oto [D]efinition')
    nmap('gD',         vim.lsp.buf.declaration,                        '[G]oto [D]eclaration')
    nmap('gr',         require('telescope.builtin').lsp_references,    '[G]oto [R]eferences')
    nmap('gi',         vim.lsp.buf.implementation,                     '[G]oto [I]mplementation')

    nmap('K',          vim.lsp.buf.hover,                              'Hover Documentation')
    nmap('<C-k>',      vim.lsp.buf.signature_help,                     'Signature Documentation')

    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder,               '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder,            '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    vim.keymap.set('n', '<leader>=', function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = bufnr, desc = 'LSP: Format the current buffer' })
  end,
})

-- Diagnostics keymaps (global, not buffer-scoped)
vim.keymap.set('n', '[g', function() vim.diagnostic.jump({ count = -1, float = true }) end,
  { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']g', function() vim.diagnostic.jump({ count = 1, float = true }) end,
  { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>go', vim.diagnostic.open_float, { desc = 'Open floating diagnostic' })
vim.keymap.set('n', '<leader>gl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

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
  'omnisharp',
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
