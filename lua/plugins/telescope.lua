local M = {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = { 'Telescope', },
        keys = {
            { "<leader>tf", "<cmd>Telescope find_files<CR>",  desc = "Fuzzy file finder" },
            { "<leader>tb", "<cmd>Telescope buffers<CR>",     desc = "Fuzzy buffer finder" },
            { "<leader>tg", "<cmd>Telescope live_grep<CR>",   desc = "Live grep" },
            { "<leader>to", "<cmd>Telescope oldfiles<CR>",    desc = "Recently opened files" },
            { "<leader>tc", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme picker" },
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
