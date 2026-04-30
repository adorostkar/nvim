local M = {
    {
        "mistricky/codesnap.nvim",
        tag = "v2.0.1",
        opts = {
            save_path = "~/Downloads",
            snapshot_config = {
                theme = "bamboo",
                code_config = {
                    breadcrumbs = {
                        enable = true,
                    },
                },
                watermark = "none",
            },
        },
    },
}

return M
