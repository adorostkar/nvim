local M = {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- Simple sidebar
            require('nvim-tree').setup({
                disable_netrw = true,
                hijack_netrw = true,
                respect_buf_cwd = true,
                sync_root_with_cwd = true,
                update_focused_file = {
                    enable = true,
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true
                },
                actions = {
                    open_file = {
                        quit_on_open = true,
                        window_picker = {
                            enable = false,
                        },
                    },
                },
            })

            -- Key mapping
            local map = vim.keymap.set

            map("n", "<C-n>", "<cmd> NvimTreeToggle<CR>", { silent = true })
        end,
    },
}

return M
