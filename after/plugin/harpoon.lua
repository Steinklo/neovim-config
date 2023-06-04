local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "harpoon mark" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "harpoon menu" })

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "harpoon 1" })
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "harpoon 2" })
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "harpoon 3" })
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "harpoon 4" })
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = "harpoon 5" })
