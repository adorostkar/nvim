local M = {
    {
        "mistricky/codesnap.nvim",
        build = 'make build_generator',
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
