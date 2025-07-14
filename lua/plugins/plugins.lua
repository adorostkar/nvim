return {
    -- E X P E R I M E N T S
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
        'folke/neodev.nvim',
        ft = { 'lua', 'vim', },
        config = function()
            require("neodev").setup({})

            -- then setup your lsp server as usual
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace"
                        }
                    }
                }
            })
        end,
    },
    {
        "nvim-pack/nvim-spectre",
        opts = {},
    },
    {
        'preservim/tagbar',
    },
    -- E N D   E X P E R I M E N T S
    -- C O N F I G U R I N G
    {
        'ntpeters/vim-better-whitespace',
        event = 'BufRead', -- only load when a buffer is opened
    },
    {
        "folke/trouble.nvim",
        cmd = { 'Trouble', 'TroubleClose', 'TroubleRefresh', 'TroubleToggle', },
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
        config = function()
            local map = vim.keymap.set
            map({'n', 'v'}, "ga", "<Plug>(EasyAlign)", { silent = true })
        end,
    },
    {
        "dhruvasagar/vim-table-mode",
        keys = { '<Leader>tm' },
    },
    -- E N D   E V A L U A T I N G
}
