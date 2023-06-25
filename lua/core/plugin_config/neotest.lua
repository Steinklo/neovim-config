vim.keymap.set('n', '<Leader>ta', function() require("neotest").run.attach() end, { desc = "Test attach nearest" })
vim.keymap.set('n', '<Leader>tn', function() require("neotest").run.run() end, { desc = "Test nearest" })
vim.keymap.set('n', '<Leader>tf', function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test file" })
vim.keymap.set('n', '<Leader>ts', function() require("neotest").run.stop() end, { desc = "Test stop" })
