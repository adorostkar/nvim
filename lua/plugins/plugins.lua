return {
    -- E X P E R I M E N T S
    -- { 'mhinz/vim-startify' },
    -- { 'tpope/vim-vinegar', }, -- alternative to nvim-tree based on netrw
    -- {
    --     "folke/which-key.nvim",
    --     event = "VeryLazy",
    --     init = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --     end,
    --     opts = {
    --         -- your configuration comes here
    --         -- or leave it empty to use the default settings
    --         -- refer to the configuration section below
    --     }
    -- },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    -- { 'folke/neodev.nvim', opts= {}},
    -- E N D   E X P E R I M E N T S
    -- C O N F I G U R I N G
    {
        'ntpeters/vim-better-whitespace',
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    -- E N D   C O N F I G U R I N G
    -- E V A L U A T I N G
    { 'skywind3000/asyncrun.vim', },
    { 'tpope/vim-dispatch', },
    {
        'junegunn/vim-easy-align',
        config = function()
            local map = vim.keymap.set
            map({'n', 'v'}, "ga", "<Plug>(EasyAlign)", { silent = true })
        end,
    },
    {
        'kylechui/nvim-surround',
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        'junegunn/fzf.vim',
        dependencies = {
            { 'junegunn/fzf', build = 'install', },
        },
        keys = {
            { "<Right>", "<cmd> Files<CR>", "Open fuzzy file finder",},
            { "<Left>", "<cmd> Buffers<CR>", "Open fuzzy buffer finder", },
        },
    },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    { "dhruvasagar/vim-table-mode", },
    { "neovim/nvim-lspconfig", },
    -- E N D   E V A L U A T I N G
}
