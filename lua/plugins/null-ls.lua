local M = {
    {
        'nvimtools/none-ls.nvim',
        ft = { "c", "cpp", "objc", "objcpp" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            return require "configs.null-ls"
        end,
    },
}

return M
