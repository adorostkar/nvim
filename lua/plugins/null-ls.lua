local M = {
    {
        'nvimtools/none-ls.nvim',
        event = "VeryLazy",
        opts = function()
            return require "configs.null-ls"
        end,
    },
}

return M
-- return {}
