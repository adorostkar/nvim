local M = {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        },
        config = function(_, opts)
            local ok, configs = pcall(require, "nvim-treesitter.configs")
            if not ok then
                vim.schedule(function()
                    vim.notify(
                        "nvim-treesitter is missing or installed incorrectly. Run :Lazy sync nvim-treesitter or reinstall the plugin.",
                        vim.log.levels.ERROR
                    )
                end)
                return
            end

            configs.setup(opts)
        end,
    },
}

return M
