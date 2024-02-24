return {
    -- E X P E R I M E N T S
    -- { 'mhinz/vim-startify' },
    -- { 'tpope/vim-vinegar', }, -- alternative to nvim-tree based on netrw
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
        cmd = {'TodoLocList', 'TodoQuickFix', 'TodoTelescope', 'TodoTrouble'},
        opts = {},
    },
    -- { 'folke/neodev.nvim', opts= {}},
    -- E N D   E X P E R I M E N T S
    -- C O N F I G U R I N G
    {
        'ntpeters/vim-better-whitespace',
        event = 'BufRead', -- only load when a buffer is opened
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
    { "dhruvasagar/vim-table-mode", },
    -- E N D   E V A L U A T I N G
}
