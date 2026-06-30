-- nvim-treesitter v1.0 (main branch) setup.
-- The old `.configs.setup{}` API is gone; parsers are installed imperatively
-- and highlight/indent are enabled per-buffer via a FileType autocmd.

local parsers = {
  'c_sharp',
  'json',
  'yaml',
  'python',
  'javascript',
  'typescript',
  'tsx',
  'lua',
  'vim',
  'vimdoc',
  'markdown',
  'markdown_inline',
}

-- Install any parsers that aren't already on disk
local installed = require('nvim-treesitter.config').get_installed('parsers')
local to_install = vim.tbl_filter(function(p)
  return not vim.tbl_contains(installed, p)
end, parsers)
if #to_install > 0 then
  require('nvim-treesitter').install(to_install)
end

-- Collect every filetype that maps to one of our parsers
local filetypes = {}
for _, parser in ipairs(parsers) do
  vim.list_extend(filetypes, vim.treesitter.language.get_filetypes(parser))
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('UserTreesitter', { clear = true }),
  pattern = filetypes,
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Textobjects (v1.0 API)
require('nvim-treesitter-textobjects').setup({
  select = { lookahead = true },
})

local select = require('nvim-treesitter-textobjects.select')

-- Selection text objects
local function sel(query) return function() select.select_textobject(query, 'textobjects') end end
vim.keymap.set({ 'x', 'o' }, 'aa', sel('@parameter.outer'), { desc = 'a parameter' })
vim.keymap.set({ 'x', 'o' }, 'ia', sel('@parameter.inner'), { desc = 'inner parameter' })
vim.keymap.set({ 'x', 'o' }, 'af', sel('@function.outer'),  { desc = 'a function' })
vim.keymap.set({ 'x', 'o' }, 'if', sel('@function.inner'),  { desc = 'inner function' })
