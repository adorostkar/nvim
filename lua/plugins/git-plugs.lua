local M = {
    {
        'tpope/vim-fugitive',
        cmd = { 'Git', },
    },
    { -- shows changes on the gutter
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    {
        "NeogitOrg/neogit",
        cmd = { 'Neogit', },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true
    },
}

return M
