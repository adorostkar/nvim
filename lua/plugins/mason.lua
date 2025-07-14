local M = {
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "luau-lsp",
                "lua-language-server",
                "bash-language-server",
                "clang-format",
                "codelldb",
                "eslint",
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
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup{
            ensure_installed = {
			    "clangd",
                "lua_ls",
                "bashls",
                "eslint"
            }
			}
        end,
    },
}

return M
-- return {}

