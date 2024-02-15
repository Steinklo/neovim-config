local dap = require('dap')

-- Go
require('dap-go').setup {
    dap_configurations = {
        {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
        },
    },
}
-- Keymap
vim.keymap.set('n', '<leader>du', '<cmd>lua require("dapui").toggle()<cr>', { desc = "Toggle DapUI" })
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Debug continue" })
vim.keymap.set('n', '<F6>', function() require('dap').step_over() end, { desc = "Debug step over" })
vim.keymap.set('n', '<F7>', function() require('dap').step_back() end, { desc = "Debug step back" })
vim.keymap.set('n', '<F8>', function() require('dap').step_into() end, { desc = "Debug step into" })
vim.keymap.set('n', '<F9>', function() require('dap').step_out() end, { desc = "Debug step out" })
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = "Debug toggle breakpoint" })

-- UI
require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
