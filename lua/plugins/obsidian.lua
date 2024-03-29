local obsidian_path = os.getenv("OBSIDIAN_DIR")
if obsidian_path == nil then
    return {
        {
            "epwalsh/obsidian.nvim",
            cond = false,
        },
    }
end

local M = {
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        cmd = { 'ObsidianSearch', 'ObsidianQuickSwitch', },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = obsidian_path,
                },
            },
        },
    },
}

return M
