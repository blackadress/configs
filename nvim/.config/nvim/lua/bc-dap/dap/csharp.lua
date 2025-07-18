local M = {}

-- Debugger installation location
local DEBUGGER_LOCATION = "/usr/bin"

function M.setup()
  local dap = require("dap")

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
      console = "integratedTerminal",
      program = function()
        return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
      end,
    },
  }
end

return M
