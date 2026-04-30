local M = {
    {
        "rcarriga/nvim-notify",
        config = function()
            require('notify').setup({
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
        cond = false,
    },
}

return M
-- return {}
