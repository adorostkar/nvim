local M = {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "luau-lsp",
                "bash-language-server",
                "clang-format",
                "codelldb"
            }
        },
        config = function(_, opts)
            require('mason').setup(opts)

            -- Key mapping to make use of the ensure_installed list
            -- Note that ensure installed is not a native option
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                if opts.ensure_installed and #opts.ensure_installed > 0 then
                    vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
                end
            end, {})
        end,
    },
    { 'neovim/nvim-lspconfig' },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()

            require("mason-lspconfig").setup_handlers {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
                -- Next, you can provide a dedicated handler for specific servers.
                -- For example, a handler override for the `rust_analyzer`:
                -- ["rust_analyzer"] = function ()
                --     require("rust-tools").setup {}
                -- end
            }
        end,
    },
}

return M
-- return {}
