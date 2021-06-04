-- local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

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
  ensure_installed = "maintained",
  incremental_selection = {enable = true}
}

local ts_conds = require("nvim-autopairs.ts-conds")

-- press % => %% is only inside comment or string
npairs.add_rules(
  {
    Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({"string", "comment"})),
    Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({"function"}))
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
