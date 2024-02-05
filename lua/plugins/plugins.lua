return {
    -- E X P E R I M E N T S
    -- { 'tpope/vim-surround', },
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
    -- { 'folke/neodev.nvim', }
    -- E N D   E X P E R I M E N T S
    -- C O N F I G U R I N G
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
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
    -- { -- progress provider
    --     'j-hui/fidget.nvim',
    --     config = function()
    --         require('fidget').setup({
    --             notification = {
    --                 poll_rate = 10,               -- How frequently to update and render notifications
    --                 filter = vim.log.levels.INFO, -- Minimum notifications level
    --                 history_size = 256,           -- Number of removed messages to retain in history
    --                 override_vim_notify = true,  -- Automatically override vim.notify() with Fidget
    --                 -- Options related to the notification window and buffer
    --                 window = {
    --                     winblend = 50,             -- Background color opacity in the notification window
    --                     border = "none",            -- Border around the notification window, h fidget-options for choices
    --                     align = "top",           -- How to align the notification window
    --                     x_padding = 3,
    --                     y_padding = 1,
    --                 },
    --             },
    --         })
    --     end,
    -- },
    -- W O R K S   T O G T H E R
    { -- does same thing as fidget
        "rcarriga/nvim-notify",
        config = function()
            require('notify').setup({
                -- render = "default"
                -- render = "minimal",
                -- render = "simple"
                -- render = "compact"
                render = "wrapped-compact",
                stages = "fade_in_slide_out",
            })
            vim.notify = require('notify')
        end,
    },
    {
        'mrded/nvim-lsp-notify',
        dependencies = {
            'rcarriga/nvim-notify'
        },
        config = function()
            require('lsp-notify').setup()
        end,
    },
    -- E N D   W O R K S   T O G E T H E R
    -- { -- replaces ex line and notification provider alternative
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add any options here
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         -- "rcarriga/nvim-notify",
    --         "hrsh7th/nvim-cmp",
    --     },
    --     config = function()
    --         require("noice").setup({
    --             lsp = {
    --                 -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --                 override = {
    --                     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --                     ["vim.lsp.util.stylize_markdown"] = true,
    --                     ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    --                 },
    --             },
    --             -- you can enable a preset for easier configuration
    --             presets = {
    --                 bottom_search = true, -- use a classic bottom cmdline for search
    --                 -- command_palette = true, -- position the cmdline and popupmenu together
    --                 long_message_to_split = true, -- long messages will be sent to a split
    --                 inc_rename = false, -- enables an input dialog for inc-rename.nvim
    --                 lsp_doc_border = false, -- add a border to hover docs and signature help
    --             },
    --         })
    --     end,
    -- },
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
            'junegunn/fzf.vim',
        },
        keys = {
            -- { "<leader>ff", "<cmd> Files<CR>", "Open fuzzy file finder",},
            -- { "<leader>fb", "<cmd> Buffers<CR>", "Open fuzzy buffer finder", },
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
