return {
    -- E X P E R I M E N T S
    -- { 'mhinz/vim-startify' },
    -- { 'nvimtools/none-ls.nvim' },
    -- { 'tpope/vim-vinegar', }, -- alternative to nvim-tree based on netrw
    -- {
    --     'windwp/nvim-autopairs',
    --     event = "InsertEnter",
    --     opts = {} -- this is equalent to setup({}) function
    -- },
    -- { -- progress provider
    --     'j-hui/fidget.nvim',
    --     config = function()
    --         require('fidget').setup()
    --     end,
    -- },
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
    -- {
    --      'echasnovski/mini.trailspace', version = false,
    --      config = function()
    --          require('mini.trailspace').setup()
    --      end,
    -- },
    -- {
    --     "folke/todo-comments.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     opts = {
    --         -- your configuration comes here
    --         -- or leave it empty to use the default settings
    --         -- refer to the configuration section below
    --     }
    -- },
    -- E N D
    { -- does same thing as fidget
        "rcarriga/nvim-notify",
        config = function()
            require('notify').setup()
            vim.notify = require('notify')
        end,
    },
    { -- autocompletion framework for different sources
        'hrsh7th/nvim-cmp',
        dependencies = {
            'FelipeLema/cmp-async-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua'
        },
        config = function()
            require('cmp').setup({
                sources = {
                    { name = 'async_path' },
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                },
            })
        end,
    },
    { 
        'echasnovski/mini.indentscope', version = false,
        config = function()
            require('mini.indentscope').setup()
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    },
    {
        'skywind3000/asyncrun.vim',
    },
    { -- not sure if needed. Trying to replicate vim stuff
        'tpope/vim-dispatch',
    },
    { -- easy align
        'junegunn/vim-easy-align',
        config = function()
            local map = vim.keymap.set
            map({'n', 'v'}, "ga", "<Plug>(EasyAlign)", { silent = true })
        end,
    },
    { -- quickfix filtering
        'sk1418/QFGrep',
    },
    { -- quickfix preview
        'kevinhwang91/nvim-bqf',
        dependencies = {
            'junegunn/fzf',
        },
    },
    { 'tpope/vim-surround', },
    { 'junegunn/fzf', },
    { 
        'junegunn/fzf.vim',
        keys = {
            { "<leader>ff", "<cmd> Files<CR>", "Open fuzzy file finder",},
            { "<leader>fb", "<cmd> Buffers<CR>", "Open fuzzy buffer finder", },
        },
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true
    },
    { "dhruvasagar/vim-table-mode", },
    {
        "mileszs/ack.vim",
        event="VeryLazy",
        config = function()
            if vim.fn.executable('rg') == 1 then
                vim.g.ackprg='rg --vimgrep --no-heading'
            end
        end, 
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
            }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        }
    },
    {
        "neovim/nvim-lspconfig",
    },
}
