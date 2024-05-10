local M = {
    {
        'ibhagwan/fzf-lua',
        dependencies = {
            { 'junegunn/fzf', build = './install --all', },
            'nvim-tree/nvim-web-devicons',
        },
        cmd = { 'FzfLua' },
        keys = {
            { "<Right>", "<cmd>FzfLua files<CR>", "Open fuzzy file finder",},
            { "<Left>", "<cmd>FzfLua buffers<CR>", "Open fuzzy buffer finder", },
        },
    },
    {
        'junegunn/fzf.vim',
        dependencies = {
            { 'junegunn/fzf', build = './install', },
        },
        keys = {
            { "<Right>", "<cmd> Files<CR>", "Open fuzzy file finder",},
            { "<Left>", "<cmd> Buffers<CR>", "Open fuzzy buffer finder", },
        },
        cond = false,
    },
}

return M
