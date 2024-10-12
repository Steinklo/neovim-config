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

function WordCount()
  local wc = vim.fn.wordcount()
  print("Words: " .. wc.words)
end

vim.keymap.set("n", "<leader>wc", WordCount, { desc = "Count words in buffer" })
vim.keymap.set("n", "<leader>lw", WordCount, { desc = "Count words in buffer" })


if vim.fn.has('autocmd') == 1 then
  vim.api.nvim_create_augroup("format_tex_on_save", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "format_tex_on_save",
    pattern = "*.tex",
    callback = function()
      local lines = vim.fn.getline(1, '$')
      local new_lines = {}

      for _, line in ipairs(lines) do
        while #line > 80 do
          local linePos = 80
          for i = 80, 1, -1 do
            if line:sub(i, i):match("[,%. ]") then
              linePos = i
              table.insert(new_lines, line:sub(1, linePos))
              break
            end
          end
          line = line:sub(linePos + 1)
        end
        table.insert(new_lines, line)
      end

      vim.fn.setline(1, new_lines)
    end,
  })
end
