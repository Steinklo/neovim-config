-- Enable Harpoon
require("harpoon").setup()

vim.keymap.set('n', '<c-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
    { noremap = true, silent = true, desc = 'Harpoon Toggle UI' })
vim.keymap.set('n', '<c-m>', ':lua require("harpoon.mark").add_file()<CR>',
    { noremap = true, silent = true, desc = 'Harpoon Mark' })

vim.keymap.set('n', '<Leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>',
    { desc = 'Harpoon Mark 1' })
vim.keymap.set('n', '<Leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>',
    { desc = 'Harpoon Mark 2' })
vim.keymap.set('n', '<Leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>',
    { desc = 'Harpoon Mark 3' })
vim.keymap.set('n', '<Leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>',
    { desc = 'Harpoon Mark 4' })
vim.keymap.set('n', '<Leader>5', ':lua require("harpoon.ui").nav_file(5)<CR>',
    { desc = 'Harpoon Mark 5' })
