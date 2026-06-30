vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>")

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Yank to the system clipboard ("+" register); deletes/pastes use Vim's own registers
vim.keymap.set({ "n", "v" }, "y", [["+y]])
vim.keymap.set({ "n", "v" }, "Y", [["+Y]])

-- Text editing
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace text" })

-- Buffer
vim.keymap.set("n", "<S-h>", ":bp<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", ":bn<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { silent = true, desc = "Close buffer" })

function CloseOtherBuffers()
    local current_buf = vim.fn.bufnr('%')
    for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
        if buf.bufnr ~= current_buf then
            vim.cmd('silent! w | bdelete ' .. buf.bufnr)
        end
    end
end

vim.keymap.set('n', '<leader>Q', CloseOtherBuffers,
    { silent = true, desc = "Close all buffers except current" })

-- Navigation
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
