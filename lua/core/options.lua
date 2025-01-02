vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.b.copilot_enabled = false
    end,
})

local floating_terminal = nil
local floating_buf = nil

function ToggleFloatingTerminal()
    -- Close the terminal if it's already open
    if floating_terminal and vim.api.nvim_win_is_valid(floating_terminal) then
        vim.api.nvim_win_close(floating_terminal, true)
        floating_terminal = nil
        floating_buf = nil
    else
        -- Get editor dimensions
        local width = vim.o.columns
        local height = vim.o.lines

        -- Set floating terminal dimensions
        local win_width = math.floor(width * 0.8)     -- 80% of the editor's width
        local win_height = math.floor(height * 0.4)   -- 40% of the editor's height
        local row = math.floor((height - win_height) / 2) -- Center row
        local col = math.floor((width - win_width) / 2) -- Center column

        -- Create a new floating terminal
        floating_buf = vim.api.nvim_create_buf(false, true) -- Create a new scratch buffer
        floating_terminal = vim.api.nvim_open_win(floating_buf, true, {
            relative = 'editor',
            width = win_width,
            height = win_height,
            row = row,
            col = col,
            style = 'minimal',
            border = 'rounded', -- Add a rounded border
        })
        vim.cmd('terminal') -- Open a terminal in the floating window
        vim.cmd('startinsert') -- Enter Insert mode automatically
    end
end

-- Keymaps for both Normal and Terminal modes
vim.api.nvim_set_keymap('n', '<C-%>', ':lua ToggleFloatingTerminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-%>', [[<C-\><C-n>:lua ToggleFloatingTerminal()<CR>]], { noremap = true, silent = true })

-- Map <Esc> to close the terminal in Terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>:lua ToggleFloatingTerminal()<CR>]], { noremap = true, silent = true })
