local dap = require('dap')

dap.adapters.coreclr = {
    type = 'executable',
    command = 'C:/Users/david/AppData/Local/bin/netcoredbg/netcoredbg.exe',
    args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
    },
}

vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end, { desc = "debug continue" })
vim.keymap.set('n', '<Leader>do', function() require('dap').step_over() end, { desc = "debug step over" })
vim.keymap.set('n', '<Leader>dk', function() require('dap').step_back() end, { desc = "debug step back" })
vim.keymap.set('n', '<Leader>di', function() require('dap').step_into() end, { desc = "debug step into" })
vim.keymap.set('n', '<Leader>dc', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>dt', function() require('dap').toggle_breakpoint() end, { desc = "debug toggle breakpoint" })
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end, { desc = "debug hover" })
