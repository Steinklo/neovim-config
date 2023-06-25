vim.g.mapleader = " "
vim.keymap.set("n", '<Space>', '<Nop>')

-- Move lines in visaul mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remap to clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["*p]], { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["*y]], { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["*d]], { desc = "Cut to clipboard" })

-- Text editing
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace text" })

-- Navigation
vim.keymap.set("n", "<Tab>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Codecompletion
vim.keymap.set("c", "<Tab>", function()
     if vim.fn.pumvisible() == 1 then return '<c-y>' end
         return '<cr>'
         end, { expr = true })

