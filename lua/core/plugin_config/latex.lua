vim.g.maplocalleader = ','

vim.keymap.set('n', '<Leader>lt', ':VimtexTocToggle<CR>', { desc = 'Vimtex Table of Contents' })
vim.keymap.set('n', '<Leader>ll', ':VimtexCompile<CR>', { desc = 'Vimtex Compile' })
vim.keymap.set('n', '<Leader>lv', ':VimtexView<CR>', { desc = 'Vimtex View' })
vim.keymap.set('n', '<Leader>ls', ':VimtexStop<CR>', { desc = 'Vimtex Stop' })
vim.keymap.set('n', '<Leader>lc', ':VimtexClean<CR>', { desc = 'Vimtex Clean' })
vim.keymap.set('n', '<Leader>lr', ':VimtexRecompile<CR>', { desc = 'Vimtex Recompile' })

vim.api.nvim_create_augroup('format_tex_on_save', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'format_tex_on_save',
  pattern = '*.tex',
  callback = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local new_lines = {}

    for _, line in ipairs(lines) do
      while #line > 80 do
        local break_pos
        for i = 80, 1, -1 do
          if line:sub(i, i):match('[,%. ]') then
            break_pos = i
            break
          end
        end
        -- Fall back to a hard cut at 80 if no natural break point is found,
        -- otherwise the loop would never consume the line.
        break_pos = break_pos or 80
        table.insert(new_lines, line:sub(1, break_pos))
        line = line:sub(break_pos + 1)
      end
      table.insert(new_lines, line)
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
  end,
})
