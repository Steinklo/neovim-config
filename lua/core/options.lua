vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.b.copilot_enabled = false
  end,
})


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

