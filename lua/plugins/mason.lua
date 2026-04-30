local mason_packages = {
    "clangd",
    "luau-lsp",
    "lua-language-server",
    "bash-language-server",
    "clang-format",
    "codelldb",
    "eslint",
}

local servers = {
    bashls = {},
    clangd = {},
    eslint = {},
    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace",
                },
            },
        },
    },
    luau_lsp = {},
}

local M = {
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function(_, opts)
            require("mason").setup(opts)

            if vim.fn.exists(":MasonInstallAll") == 0 then
                vim.api.nvim_create_user_command("MasonInstallAll", function()
                    vim.cmd("MasonInstall " .. table.concat(mason_packages, " "))
                end, {})
            end
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers),
                handlers = {
                    function(server_name)
                        local server_opts = vim.tbl_deep_extend("force", {
                            capabilities = capabilities,
                        }, servers[server_name] or {})

                        lspconfig[server_name].setup(server_opts)
                    end,
                },
            })
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
    },
}

return M
-- return {}

