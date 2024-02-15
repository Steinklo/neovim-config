vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>")

-- Move lines in visaul mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remap to clipboard
vim.keymap.set({ "n", "v" }, "p", [["*p]])
vim.keymap.set({ "n", "v" }, "P", [["*P]])
vim.keymap.set({ "n", "v" }, "y", [["*y]])
vim.keymap.set({ "n", "v" }, "Y", [["*Y]])
vim.keymap.set({ "n", "v" }, "d", [["*d]])
vim.keymap.set({ "n", "v" }, "D", [["*D]])
vim.keymap.set({ "n", "v" }, "x", [["*x]])

-- Text editing
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace text" })

-- Quality of life
vim.keymap.set("n", "<Leader>q", ":q <CR>")

-- Navigation
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
