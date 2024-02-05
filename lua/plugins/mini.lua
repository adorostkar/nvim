local M = {
    {
        'echasnovski/mini.nvim', version = false,
        config = function() -- each mini submodule should be setup here
            require('mini.indentscope').setup()
            require('mini.comment').setup()
            require('mini.splitjoin').setup()
        end
    },
}

return M
