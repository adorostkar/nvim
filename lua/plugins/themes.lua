local M = {
    {
        'adorostkar/themer.nvim',
        opts = { initial_theme = 'tokyonight-night'},
        priority = 1000,
        lazy = false,
        dependencies = {
            'nvim-telescope/telescope.nvim',
            "folke/tokyonight.nvim",
            "navarasu/onedark.nvim",
            {
                "catppuccin/nvim",
                name = "catppuccin",
            },
        }
    },
}

return M
-- return {}
