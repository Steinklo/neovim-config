vim.g.coc_global_extensions = {
    "coc-css",
    "coc-json",
    "coc-docker",
    "coc-yaml",
    "coc-python",
    "coc-go",
    "coc-sumneko-lua",
    "coc-explorer"
}

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

-- Explorer
keyset("n", "<leader>e", ": CocCommand explorer<CR>", { desc = "toggle explorer" })


-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true, desc = "prev error" })
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true, desc = "next error" })

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true, desc = "go to definition" })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true, desc = "type definition" })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true, desc = "go to implementation" })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true, desc = "show references" })
--
-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })
