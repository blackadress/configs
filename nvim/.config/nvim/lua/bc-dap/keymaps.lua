M = {}

function M.setup()
  vim.keymap.set("n", "<leader>b", function()
    require("dap").toggle_breakpoint()
  end, { desc = "breakpoint" })
  vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
  end)
end

return M
