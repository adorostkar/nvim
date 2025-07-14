local M = {
    {
        "mistricky/codesnap.nvim",
        build = 'make',
        opts = {
            save_path = "~/Downloads",
            has_breadcrumbs = true,
            -- bg_x_padding = 80,
            -- bg_y_padding = 60,
            bg_padding = nil,
            bg_theme = "bamboo",
            watermark = ""
        },
    },
}

return M
