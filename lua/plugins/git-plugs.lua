local M = {
    {
        'tpope/vim-fugitive',
        cmd = { 'Git', },
    },
    { -- shows changes on the gutter
        'lewis6991/gitsigns.nvim',
        opts = {},
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
