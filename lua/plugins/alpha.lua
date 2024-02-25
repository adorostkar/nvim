local M = {
	'goolord/alpha-nvim',
	event = 'VimEnter',
	opts = function()
        local alpha = require("alpha")
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

        local hasObsidian, _ = pcall(require, 'obsidian')
        if hasObsidian then
            vim.list_extend(
                buttons,
                {
                    dashboard.button('o', '󱓧    Obsidian', ':ObsidianQuickSwitch<CR>'),
                }
            )
        end

        vim.list_extend(buttons,
            {
                dashboard.button('r', '    recent files', ':Telescope oldfiles<CR>'),
                dashboard.button('f', '󰥨    find file', ':FzfLua files<CR>'),
                -- dashboard.button('f', '󰥨    find file', ':Telescope find_files<CR>'),
                dashboard.button('g', '󰱼    find text', ':Telescope live_grep_args<CR>'),
                dashboard.button('h', '    browse git', ':Flog<CR>'),
                dashboard.button('l', '󰒲    lazy', ':Lazy<CR>'),
                dashboard.button('m', '󱌣    mason', ':Mason<CR>'),
                dashboard.button('u', '󰚰    Update config', ':!(cd ~/.config/nvim && git pull)<CR>'),
                dashboard.button('q', '󰭿    quit', ':qa<CR>'),
            }
        )
		dashboard.section.buttons.val = buttons
		return dashboard
	end,
	config = function(_, dashboard)
		require('alpha').setup(dashboard.opts)

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
