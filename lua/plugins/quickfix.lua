local M = {
    { -- quickfix filtering
        'sk1418/QFGrep',
        ft = 'qf',
    },
    { -- quickfix preview
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
        dependencies = {
            'junegunn/fzf',
        },
    },
}

return M
