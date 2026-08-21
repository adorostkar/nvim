local M = {
    {
        'adorostkar/themer.nvim',
        branch = 'perf/lazy-picker',
        opts = {
            initial_theme = 'tokyonight-night',
            themes = {
                'tokyonight',
                'tokyonight-day',
                'tokyonight-moon',
                'tokyonight-night',
                'tokyonight-storm',
                'onedark',
                'catppuccin',
                'catppuccin-frappe',
                'catppuccin-latte',
                'catppuccin-macchiato',
                'catppuccin-mocha',
            },
            load_picker = function()
                require('lazy').load({ plugins = { 'telescope.nvim' } })
            end,
        },
        priority = 1000,
        lazy = false,
    },
    { 'folke/tokyonight.nvim', lazy = true },
    { 'navarasu/onedark.nvim', lazy = true },
    { 'catppuccin/nvim', name = 'catppuccin', lazy = true },
}

return M
