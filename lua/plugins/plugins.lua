return {
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
    -- { 'tpope/vim-vinegar', }, -- alternative to nvim-tree based on netrw
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
}
