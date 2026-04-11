local wk = require('which-key')

wk.add({
  { '<leader>f',  group = 'file' },
  { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find File', mode = 'n' },
  { '<leader>w',  proxy = '<c-w>',                 group = 'windows' },
  {
    '<leader>b',
    group = 'buffers',
    expand = function()
      return require('which-key.extras').expand.buf()
    end,
  },
  { mode = { 'n', 'v' } },
})
