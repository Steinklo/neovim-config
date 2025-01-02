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

-- Word count function for LaTeX documents
local function get_included_files(filepath)
    local files = {}
    local file = io.open(filepath, "r")

    if file then
        for line in file:lines() do
            -- Look for \include or \input commands
            local include_file = line:match("\\include{([^}]+)}") or line:match("\\input{([^}]+)}")
            if include_file then
                -- Add .tex extension if it's missing
                if not include_file:match("%.tex$") then
                    include_file = include_file .. ".tex"
                end
                table.insert(files, include_file)
            end
        end
        file:close()
    else
        print("Error: Cannot open file: " .. filepath)
    end

    return files
end

local function count_words_in_file(filepath)
    local file = io.open(filepath, "r")
    if not file then
        print("Error: Cannot open file: " .. filepath)
        return 0
    end

    local content = ""
    for line in file:lines() do
        -- Remove LaTeX commands and comments for better word counting
        line = line:gsub("\\%a+%b{}", "") -- Remove commands like \command{arg}
        line = line:gsub("\\%a+", "") -- Remove single LaTeX commands like \command
        line = line:gsub("%%.*", "")  -- Remove comments
        content = content .. " " .. line
    end

    file:close()

    -- Count words in the sanitized content
    local _, word_count = content:gsub("%S+", "")
    return word_count
end

local function word_count()
    -- Get the full path of the current buffer
    local main_file = vim.fn.expand("%:p")
    if main_file == "" then
        print("No file detected!")
        return 0
    end

    -- Initialize total word count
    local total_word_count = 0

    -- Process the main file and included files
    local files_to_process = { main_file }
    local processed_files = {}

    while #files_to_process > 0 do
        local current_file = table.remove(files_to_process)
        if not processed_files[current_file] then
            -- Mark the file as processed
            processed_files[current_file] = true

            -- Count words in the current file
            total_word_count = total_word_count + count_words_in_file(current_file)

            -- Find and add included files
            local included_files = get_included_files(current_file)
            for _, included_file in ipairs(included_files) do
                -- Resolve to absolute path relative to the main file's directory
                local included_path = vim.fn.fnamemodify(vim.fn.fnamemodify(current_file, ":h") .. "/" .. included_file, ":p")
                if vim.fn.filereadable(included_path) == 1 then
                    table.insert(files_to_process, included_path)
                else
                    print("Warning: Included file not found: " .. included_path)
                end
            end
        end
    end

    -- Print the total word count
    return total_word_count
end

local function WordCount()
    print("Total Words: " .. word_count())
end

vim.keymap.set("n", "<leader>wc", WordCount, { desc = "Count words in buffer and included files" })


vim.keymap.set("n", "<leader>wc", WordCount, { desc = "Count words in buffer" })
vim.keymap.set("n", "<leader>lw", WordCount, { desc = "Count words in buffer" })
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
                        local main_file = vim.fn.expand("%:p")
                        if main_file == "" then
                            return "Words: 0"
                        end
                        return "Words: " .. word_count()
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
