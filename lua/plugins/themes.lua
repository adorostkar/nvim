local M = {
    { -- color theme
        "navarasu/onedark.nvim",
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
