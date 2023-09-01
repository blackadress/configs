local rest = require("rest-nvim")

rest.setup({
  jump_to_request = true,
  result_split_horizontal = false,
  result_split_in_place = true,
  highlight = {
    enabled = true,
    timeout = 150,
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "http",

  callback = function()
    local buff = tonumber(vim.fn.expand("<abuf>"), 10)
    vim.keymap.set("n", "<leader>re", rest.run, { buffer = buff })
    vim.keymap.set("n", "<leader>rr", rest.last, { buffer = buff })
    vim.keymap.set("n", "<leader>pr", function()
      rest.run(true)
    end, { buffer = buff })
  end,
})
