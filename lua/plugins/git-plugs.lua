local M = {
    { -- shows changed on the left side
        'lewis6991/gitsigns.nvim',
        opts = {}, -- same as running empty setup
    },
    {
        "NeogitOrg/neogit",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true
    },
}

return M
-- return {}
