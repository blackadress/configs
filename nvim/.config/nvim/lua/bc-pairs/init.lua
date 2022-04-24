-- local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require('nvim-autopairs.conds')

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = {"string"},
    -- it will not add pair on that treesitter node
    javascript = {"template_string"}
  }
}

require("nvim-treesitter.configs").setup {
  autopairs = {enable = true},
  highlight = {enable = true},
  autotag = {enable = true},
  ensure_installed = "all",
  incremental_selection = {enable = true}
}

-- local ts_conds = require("nvim-autopairs.ts-conds")

-- press % => %% is only inside comment or string
npairs.add_rules(
  {
    Rule("'", "'")
      -- don't add a pair if  the previous character is \
      :with_pair(cond.not_before_regex("%\\", 1)),
    Rule("(", ")")
      -- don't add a pair if  the previous character is \
      :with_pair(cond.not_before_regex("%\\", 1))
  }
)

local remap = vim.api.nvim_set_keymap
_G.MUtils = {}

MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end

remap("i", "<C-Space>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true})
