vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    adaptive_size = true
  },
  filters = {
    custom = {
      "\\.aux$",
      "\\.lof$",
      "\\.log$",
      "\\.lot$",
      "\\.fls$",
      "\\.out$",
      "\\.toc$",
      "\\.fmt$",
      "\\.fot$",
      "\\.cb$",
      "\\.cb2$",
      "\\.lb$"
    }
  }
})

-- Open NvimTree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("NvimTreeOpen")
  end,
})

vim.keymap.set('n', '<Leader>nc', ':NvimTreeClose<CR>', { desc = "Nvimtree close" })
vim.keymap.set('n', '<Leader>no', ':NvimTreeOpen<CR>', { desc = "Nvimtree open" })
vim.keymap.set('n', '<Leader>e', ':NvimTreeFocus<CR>', { desc = "Nvimtree toggle focus" })

