local M = {
    {
        "rbong/vim-flog",
        lazy = true,
        cmd = { "FFlog", "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            "tpope/vim-fugitive",
        },
        config = function()
            vim.api.nvim_create_user_command('FFlog',
                function(opts)
                    vim.cmd('Flog ' .. opts.args .. ' -- --date=short')
                end, { nargs = '?' })
        end,
    },
}

return M
