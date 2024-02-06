local M = {
    {
        'junegunn/fzf.vim',
        dependencies = {
            { 'junegunn/fzf', build = 'install', },
        },
        keys = {
            { "<Right>", "<cmd> Files<CR>", "Open fuzzy file finder",},
            { "<Left>", "<cmd> Buffers<CR>", "Open fuzzy buffer finder", },
        },
    },
}

return M
