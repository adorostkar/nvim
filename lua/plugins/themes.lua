local M = {
    {
        "folke/tokyonight.nvim",
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
            -- vim.cmd([[colorscheme tokyonight]])
        -- end,
    },
    { -- color theme
        "navarasu/onedark.nvim",
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
            -- vim.cmd([[colorscheme onedark]])
        -- end,
    },
    { -- color theme
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
}

return M
-- return {}
