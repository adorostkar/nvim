local M = {
    {
        "mistricky/codesnap.nvim",
        tag = "v2.0.1",
        cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapASCII", "CodeSnapHighlight", "CodeSnapHighlightSave" },
        opts = {
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
