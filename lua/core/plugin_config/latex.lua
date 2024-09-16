-- Enable filetype detection and plugins, necessary for VimTeX
vim.cmd('filetype plugin indent on')

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Set the custom viewer for VimTeX to SumatraPDF with the full path
vim.g.vimtex_view_method = 'general'
vim.g.vimtex_view_general_viewer = 'C:/Users/david/AppData/Local/SumatraPDF/SumatraPDF.exe'
vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'


-- Change the local leader key (optional)
vim.g.maplocalleader = ","

-- Key mappings for VimTeX (using Neovim 0.7+)
vim.keymap.set('n', '<Leader>lt', ':VimtexTocToggle<CR>', { desc = "Vimtex Table of Contents" })
vim.keymap.set('n', '<Leader>ll', ':VimtexCompile<CR>', { desc = "Vimtex Compile" })
vim.keymap.set('n', '<Leader>lv', ':VimtexView<CR>', { desc = "Vimtex View" })
vim.keymap.set('n', '<Leader>ls', ':VimtexStop<CR>', { desc = "Vimtex Stop" })
vim.keymap.set('n', '<Leader>lc', ':VimtexClean<CR>', { desc = "Vimtex Clean" })
vim.keymap.set('n', '<Leader>lr', ':VimtexRecompile<CR>', { desc = "Vimtex Recompile" })
