require 'nvim-treesitter.configs'.setup {

    ensure_installed = { "help", "javascript", "json", "typescript", "c", "lua", "rust", "go", "c_sharp" },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
    },
}
