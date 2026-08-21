local M = {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            {
                "jay-babu/mason-nvim-dap.nvim",
                dependencies = { "mason-org/mason.nvim" },
                opts = {
                    ensure_installed = { "codelldb" },
                    handlers = {},
                },
            },
            {
                "rcarriga/nvim-dap-ui",
                dependencies = { "nvim-neotest/nvim-nio" },
                config = function()
                    local dap, dapui = require("dap"), require("dapui")
                    dapui.setup()
                    dap.listeners.before.attach.dapui_config = function()
                        dapui.open()
                    end
                    dap.listeners.before.launch.dapui_config = function()
                        dapui.open()
                    end
                    dap.listeners.before.event_terminated.dapui_config = function()
                        dapui.close()
                    end
                    dap.listeners.before.event_exited.dapui_config = function()
                        dapui.close()
                    end
                end,
            },
        },
        keys = {
            { "<Leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
            { "<Leader>dr", "<cmd>DapContinue<CR>", desc = "Continue / Start" },
            { "<Leader>dn", "<cmd>DapStepOver<CR>", desc = "Step over" },
            { "<Leader>di", "<cmd>DapStepInto<CR>", desc = "Step into" },
            { "<Leader>do", "<cmd>DapStepOut<CR>", desc = "Step out" },
            { "<Leader>dq", "<cmd>DapTerminate<CR>", desc = "Terminate" },
            { "<Leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
        },
    },
}

return M
