-- Necessary for VimTeX to load properly
vim.cmd('filetype plugin indent on')

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Choose one of the following viewer configurations:
-- If you want to use zathura:
vim.g.vimtex_view_method = 'zathura'


-- Change the local leader key (optional)
vim.g.maplocalleader = ","

-- Key mappings (if using Neovim 0.7 or later)
vim.keymap.set('n', '<Leader>lt', ':VimtexTocToggle<CR>', { desc = "Vimtex Table of Contents" })
vim.keymap.set('n', '<Leader>ll', ':VimtexCompile<CR>', { desc = "Vimtex Compile" })
vim.keymap.set('n', '<Leader>lv', ':VimtexView<CR>', { desc = "Vimtex View" })
vim.keymap.set('n', '<Leader>ls', ':VimtexStop<CR>', { desc = "Vimtex Stop" })
vim.keymap.set('n', '<Leader>lc', ':VimtexClean<CR>', { desc = "Vimtex Clean" })
vim.keymap.set('n', '<Leader>lr', ':VimtexRecompile<CR>', { desc = "Vimtex Recompile" })
