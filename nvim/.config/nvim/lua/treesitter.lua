require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'rust',
        'c_sharp',
        'dockerfile',
        'go',
        'gomod',
        'java',
        'json',
        'javascript',
        'lua',
        'toml',
        'vim',
        'yaml',
        'bash',
    },
    highlight = {
        enable = true,
    },
}
