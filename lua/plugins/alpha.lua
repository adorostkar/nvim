local M = {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    opts = function()
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            "                                              ",
            "       ███████████           █████      ██",
            "      ███████████             █████ ",
            "      ████████████████ ███████████ ███   ███████",
            "     ████████████████ ████████████ █████ ██████████████",
            "    ██████████████    █████████████ █████ █████ ████ █████",
            "  ██████████████████████████████████ █████ █████ ████ █████",
            " ██████  ███ █████████████████ ████ █████ █████ ████ ██████",
        }

        local buttons = {
			dashboard.button('i', '    new file', ':ene <BAR> startinsert<CR>'),
        }

        vim.list_extend(buttons,
            {
                dashboard.button('r', '    recent files', ':Telescope oldfiles<CR>'),
                -- dashboard.button('f', '󰥨    find file', ':Telescope find_files<CR>'),
                dashboard.button('f', '󰥨    Find file', ':FzfLua files<CR>'),
                dashboard.button('g', '󰱼    Find text', ':Telescope live_grep<CR>'),
                dashboard.button('h', '    Browse git', ':Flog<CR>'),
                dashboard.button('l', '󰒲    Lazy', ':Lazy<CR>'),
                dashboard.button('m', '󱌣    Mason', ':Mason<CR>'),
                dashboard.button('n', '󰚰    Open nvim config', ":lua vim.cmd.cd(vim.fn.stdpath('config')); vim.cmd('FzfLua files')<CR>"),
                dashboard.button('q', '󰭿    Quit', ':qa<CR>'),
            }
        )
        dashboard.section.buttons.val = buttons
        return dashboard
    end,
    config = function(_, dashboard)
        require('alpha').setup(dashboard.config)

		vim.api.nvim_create_autocmd('User', {
			pattern = 'LazyVimStarted',
			callback = function()
				local stats = require('lazy').stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = '󱐋 ' .. stats.count .. ' plugins loaded in ' .. ms .. 'ms'
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
    end,
}

return M
