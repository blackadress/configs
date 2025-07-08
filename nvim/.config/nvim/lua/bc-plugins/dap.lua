return {
  -- debugger dap
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    -- require("bc-dap")
    local dap = require("dap")
    local DEBUGGER_LOCATION = "/usr/bin"

    -- Adapter configuration
    dap.adapters.coreclr = {
      type = "executable",
      command = DEBUGGER_LOCATION .. "/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    -- Configuration
    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end,
      },
    }

    local dapui = require("dapui")
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
