vim.g.mapleader = " "
vim.keymap.set("n", '<Space>', '<Nop>')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "cmd ex" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "p", [["*p]])
vim.keymap.set({ "n", "v" }, "P", [["*P]])
vim.keymap.set({ "n", "v" }, "y", [["*y]])
vim.keymap.set({ "n", "v" }, "yy", [["*yy]])
vim.keymap.set({ "n", "v" }, "Y", [["*y$]])
vim.keymap.set({ "n", "v" }, "d", [["*d]])
vim.keymap.set({ "n", "v" }, "dd", [["*dd]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace text" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
