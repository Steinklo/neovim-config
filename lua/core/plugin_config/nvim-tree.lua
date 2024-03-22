vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    adaptive_size = true
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  }
})

vim.keymap.set('n', '<Leader>nc', ':NvimTreeClose<CR>', { desc = "Nvimtree close" })
vim.keymap.set('n', '<Leader>no', ':NvimTreeOpen<CR>', { desc = "Nvimtree open" })
vim.keymap.set('n', '<Leader>e', ':NvimTreeFocus<CR>', { desc = "Nvimtree toggle focus" })
