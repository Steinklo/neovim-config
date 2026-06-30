local wk = require('which-key')

wk.add({
  -- Groups (the icon shows for the group and cascades to its children)
  { '<leader>f', group = 'find',        icon = { icon = '', color = 'green' } },
  { '<leader>d', group = 'diagnostics', icon = { icon = '', color = 'red' } },
  { '<leader>c', group = 'code',        icon = { icon = '', color = 'orange' } },
  { '<leader>w', group = 'windows', proxy = '<c-w>', icon = { icon = '', color = 'blue' } },

  -- Standalone leader keys (descriptions come from the keymaps themselves)
  { '<leader>e', icon = { icon = '', color = 'yellow' } },
  { '<leader>s', icon = { icon = '', color = 'green' } },
  { '<leader>q', icon = { icon = '', color = 'red' } },
  { '<leader>Q', icon = { icon = '', color = 'red' } },
  { '<leader>r', icon = { icon = '', color = 'cyan' } },
  { '<leader>=', icon = { icon = '', color = 'orange' } },

  { mode = { 'n', 'v' } },
})
