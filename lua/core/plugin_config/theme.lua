require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "",  -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

require('lualine').setup {
    options = { theme = 'gruvbox' },
    sections = {
        lualine_a = {
            {
                'buffers',
                show_filename_only = true,
                hide_filename_extension = false,
                show_modified_status = true,
                mode = 0,
                max_length = vim.o.columns * 2 / 3,
                filetype_names = {
                    TelescopePrompt = 'Telescope',
                    dashboard = 'Dashboard',
                    packer = 'Packer',
                    fzf = 'FZF',
                    alpha = 'Alpha'
                },
                use_mode_colors = true,
                symbols = {
                    modified = ' ●',
                    alternate_file = '#',
                    directory = '',
                },
            }
        },
        lualine_c = {
            'filename',
            {
                -- Custom word count component for .tex files
                function()
                    if vim.bo.filetype == 'tex' then
                        local text = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                        local content = table.concat(text, " ")
                        -- Count words ignoring LaTeX commands
                        local _, word_count = content:gsub("%S+", function(word)
                            return not word:match("^\\") and word
                        end)
                        return "Words: " .. word_count
                    else
                        return ''
                    end
                end,
                cond = function()
                    return vim.bo.filetype == 'tex'
                end,
                color = { fg = '#b8bb26', gui = 'bold' }, -- Optional styling for the word count display
            }
        }
    }
}

