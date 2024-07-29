return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            -- Dodaj swoje konfiguracje dap tutaj, jeśli potrzebujesz
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dapui = require("dapui")
            dapui.setup()

            local dap = require("dap")
            -- Automatyczne otwieranie dapui przy rozpoczęciu debugowania
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            -- Automatyczne zamykanie dapui przy zakończeniu debugowania
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "nvim-neotest/nvim-nio",
    },
}

