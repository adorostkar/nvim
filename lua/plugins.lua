return {
    {
        "NLKNguyen/papercolor-theme",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme PaperColor]])
        end,
    },
    { 'tpope/vim-vinegar', },
    { 'tpope/vim-surround', },
    { 'tomtom/tcomment_vim', },
    { 'junegunn/fzf', },
    { 
        'junegunn/fzf.vim',
        keys = {
            { "<leader>ff", "<cmd> Files<CR>", "Open fuzzy file finder",},
            { "<leader>fb", "<cmd> Buffers<CR>", "Open fuzzy buffer finder", },
        },
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>tf", "<cmd> Telescope find_files<CR>", "open fuzzy file finder", },
            { "<leader>tb", "<cmd> Telescope buffers<CR>", "open fuzzy buffer", },
            { "<leader>tg", "<cmd> Telescope live_grep<CR>", "Open live grep", }, 
            { "<leader>to", "<cmd> Telescope oldfiles<CR>", "Open list of previously opened files" },
        },
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    },
    { "dhruvasagar/vim-table-mode", },
    {
        "mileszs/ack.vim",
        event="VeryLazy",
        config = function()
            vim.g.ackprg='rg --vimgrep --no-heading'
        end, 
    }

}
