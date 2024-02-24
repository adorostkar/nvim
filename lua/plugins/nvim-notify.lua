local M = {
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
}

-- return M
return {}
