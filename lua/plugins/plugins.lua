return {
    -- { 'mhinz/vim-startify' },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            'folke/trouble.nvim',
        },
        cmd = { 'TodoLocList', 'TodoQuickFix', 'TodoTelescope', 'TodoTrouble' },
        opts = {},
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "nvim-pack/nvim-spectre",
        cmd = { "Spectre" },
        opts = {},
    },
    {
        'preservim/tagbar',
        cmd = { 'TagbarToggle', 'TagbarOpen', 'TagbarClose' },
    },
    -- E N D   E X P E R I M E N T S
    -- C O N F I G U R I N G
    {
        'ntpeters/vim-better-whitespace',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        "folke/trouble.nvim",
        cmd = 'Trouble',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    -- E N D   C O N F I G U R I N G
    -- E V A L U A T I N G
    {
        'skywind3000/asyncrun.vim',
        cmd = { 'AsyncRun', 'AsyncStop', 'AsyncReset', },
    },
    {
        'tpope/vim-dispatch',
        cmd = { 'Dispatch', 'Make' },
    },
    {
        'junegunn/vim-easy-align',
        keys = {
            { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "Easy align" },
        },
    },
    {
        "dhruvasagar/vim-table-mode",
        keys = { '<Leader>tm' },
    },
    -- E N D   E V A L U A T I N G
}
