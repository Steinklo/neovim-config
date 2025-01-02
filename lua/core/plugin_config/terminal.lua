require("toggleterm").setup {
  size = 20,
  open_mapping = [[<C-t>]],                        -- Keybinding to toggle terminal
  hide_numbers = true,                             -- Hide line numbers in terminal
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = "float",                             -- 'vertical' | 'horizontal' | 'tab' | 'float'
  float_opts = {
    border = "curved",                             -- Border type: 'single', 'double', 'shadow', 'curved'
    width = math.floor(vim.o.columns * 0.8),       -- 80% of editor width
    height = math.floor(vim.o.lines * 0.4),        -- 40% of editor height
    winblend = 3,                                  -- Transparency level (0-100)
  },
}

