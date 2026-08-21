local M = {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local parsers = { "c", "cpp", "lua", "vim", "vimdoc", "markdown", "markdown_inline" }
            local treesitter = require("nvim-treesitter")
            treesitter.setup({})

            local function enable(bufnr)
                if not vim.api.nvim_buf_is_valid(bufnr) or not vim.tbl_contains(parsers, vim.bo[bufnr].filetype) then
                    return
                end
                vim.api.nvim_buf_call(bufnr, function()
                    if pcall(vim.treesitter.start) then
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end)
            end

            if vim.fn.executable("tree-sitter") == 1 then
                treesitter.install(parsers):await(function(err)
                    if err then
                        return
                    end
                    vim.schedule(function()
                        vim.iter(vim.api.nvim_list_bufs()):each(enable)
                    end)
                end)
            else
                vim.schedule(function()
                    vim.notify("Install tree-sitter-cli with :MasonInstallAll to install parsers", vim.log.levels.WARN)
                end)
            end

            vim.api.nvim_create_autocmd("FileType", {
                pattern = parsers,
                callback = function(args) enable(args.buf) end,
            })
        end,
    },
}

return M
