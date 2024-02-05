local M = {
    {
        'nvimtools/none-ls.nvim',
        event = "VeryLazy",
        opts = function()
            return require "configs.none-ls"
        end,
    },
}

return M
-- return {}
