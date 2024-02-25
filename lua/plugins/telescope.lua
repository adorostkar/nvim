local M = {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = { 'Telescope', },
        keys = {
            { "<leader>tf", "<cmd> Telescope find_files<CR>", "open fuzzy file finder", },
            { "<leader>tb", "<cmd> Telescope buffers<CR>", "open fuzzy buffer", },
            { "<leader>tg", "<cmd> Telescope live_grep<CR>", "Open live grep", },
            { "<leader>to", "<cmd> Telescope oldfiles<CR>", "Open list of previously opened files" },
            { "<leader>tc", "<cmd> Telescope colorscheme<CR>", "Open list of colorschemes" },
        },
        config = function()
            require('telescope').setup({
                pickers = {
                    colorscheme = {
                        enable_preview = true
                    }
                }
            })
        end,
    },
}

return M
