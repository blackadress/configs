local rest = require("rest-nvim")

rest.setup(
  {
    jump_to_request = false,
    result_split_horizontal = false,
    result_split_in_place = true
  }
)

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
map("n", "<Leader>re", "<cmd>lua require('rest-nvim').run()<CR>", opts)
map("n", "<Leader>rr", "<cmd>lua require('rest-nvim').last()<CR>", opts)
map("n", "<Leader>pr", "<cmd>lua require('rest-nvim').run(true)<CR>", opts)
