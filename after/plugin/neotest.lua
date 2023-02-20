require("neotest").setup({
    adapters = {
        require("neotest-dotnet")({
            dap = { justMyCode = false },
        }),
    },
})

vim.keymap.set('n', '<Leader>ta', function() require("neotest").run.attach() end, { desc = "test attach nearest" })
vim.keymap.set('n', '<Leader>tn', function() require("neotest").run.run() end, { desc = "test nearest" })
vim.keymap.set('n', '<Leader>tf', function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "test file" })
vim.keymap.set('n', '<Leader>ts', function() require("neotest").run.stop() end, { desc = "test stop" })
