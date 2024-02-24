local M = {
    { -- progress provider
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup({
                notification = {
                    poll_rate = 10,               -- How frequently to update and render notifications
                    filter = vim.log.levels.INFO, -- Minimum notifications level
                    history_size = 256,           -- Number of removed messages to retain in history
                    override_vim_notify = true,  -- Automatically override vim.notify() with Fidget
                    -- Options related to the notification window and buffer
                    window = {
                        winblend = 50,             -- Background color opacity in the notification window
                        border = "none",            -- Border around the notification window, h fidget-options for choices
                        align = "top",           -- How to align the notification window
                        x_padding = 3,
                        y_padding = 1,
                    },
                },
            })
        end,
        cond = false,
    },
}

return M
