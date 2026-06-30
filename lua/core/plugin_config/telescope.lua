local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fi', builtin.live_grep, { desc = "Find in files (grep)" })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Find recent files" })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "Search in current buffer" })

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
