vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  -- Keep all default nvim-tree mappings
  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Esc: defocus the tree (jump back to previous window), keep tree open
  vim.keymap.set("n", "<Esc>", "<C-w>p", opts("Defocus tree"))
end

require("nvim-tree").setup({
  on_attach = on_attach,
  view = {
    adaptive_size = true
  }
})

vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', { silent = true, desc = "Open/focus file tree" })

