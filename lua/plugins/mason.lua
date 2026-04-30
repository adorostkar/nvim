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
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
        },
    },
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
            vim.diagnostic.config({
                virtual_text = { prefix = "●" },
                signs = true,
                update_in_insert = false,
                severity_sort = true,
                float = { border = "rounded", source = "always" },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
                    end

                    map("gd",         vim.lsp.buf.definition,                                          "Go to definition")
                    map("gD",         vim.lsp.buf.declaration,                                         "Go to declaration")
                    map("gr",         vim.lsp.buf.references,                                          "Go to references")
                    map("gi",         vim.lsp.buf.implementation,                                      "Go to implementation")
                    map("gy",         vim.lsp.buf.type_definition,                                     "Go to type definition")
                    map("K",          vim.lsp.buf.hover,                                               "Hover docs")
                    map("<Leader>rn", vim.lsp.buf.rename,                                              "Rename symbol")
                    map("<Leader>ca", vim.lsp.buf.code_action,                                         "Code action")
                    map("<Leader>f",  function()
                        vim.lsp.buf.format({ bufnr = ev.buf, filter = function(c) return c.name == "null-ls" end })
                    end,                                                                               "Format buffer")
                    map("[d",         vim.diagnostic.goto_prev,                                        "Previous diagnostic")
                    map("]d",         vim.diagnostic.goto_next,                                        "Next diagnostic")
                    map("<Leader>e",  vim.diagnostic.open_float,                                       "Show diagnostic")

                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    if client and client.name == "clangd" then
                        map("<Leader>ch", "<cmd>ClangdSwitchSourceHeader<CR>", "Switch header/source")
                    end

                    if vim.lsp.inlay_hint and client and client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
                    end
                end,
            })

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
