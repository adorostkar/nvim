local M = {
    {
        "mistricky/codesnap.nvim",
        tag = "v2.0.1",
        opts = {
            save_path = "~/Downloads",
            snapshot_config = {
                theme = "candy",
                code_config = {
                    breadcrumbs = {
                        enable = true,
                    },
                },
                watermark = { content = "" },
            },
        },
    },
}

return M
