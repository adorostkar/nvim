local M = {
	'goolord/alpha-nvim',
	event = 'VimEnter',
	opts = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            -- "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
            -- "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
            -- "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
            -- "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            -- "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
            -- "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚══╝  ╚═╝╚═╝     ╚═╝",
            "                                              ",
            "       ███████████           █████      ██",
            "      ███████████             █████ ",
            "      ████████████████ ███████████ ███   ███████",
            "     ████████████████ ████████████ █████ ██████████████",
            "    ██████████████    █████████████ █████ █████ ████ █████",
            "  ██████████████████████████████████ █████ █████ ████ █████",
            " ██████  ███ █████████████████ ████ █████ █████ ████ ██████",
        }

		dashboard.section.buttons.val = {
			dashboard.button('i', '    new file', ':ene <BAR> startinsert<CR>'),
			dashboard.button('r', '    recent files', ':Telescope oldfiles<CR>'),
			-- dashboard.button('f', '󰥨    find file', ':Telescope find_files<CR>'),
			dashboard.button('f', '󰥨    find file', ':FZF<CR>'),
			dashboard.button('g', '󰱼    find text', ':Telescope live_grep_args<CR>'),
			dashboard.button('h', '    browse git', ':Flog<CR>'),
			dashboard.button('l', '󰒲    lazy', ':Lazy<CR>'),
			dashboard.button('m', '󱌣    mason', ':Mason<CR>'),
			dashboard.button('p', '󰄉    profile', ':Lazy profile<CR>'),
			dashboard.button('q', '󰭿    quit', ':qa<CR>'),
		}
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
