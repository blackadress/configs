return {
  "windwp/nvim-autopairs",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- local remap = vim.api.nvim_set_keymap
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")

    npairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        -- it will not add pair on that treesitter node
        -- javascript = { "template_string" },
      },
    })

    local remap = vim.api.nvim_set_keymap
    _G.MUtils = {}

    MUtils.completion_confirm = function()
      if vim.fn.pumvisible() ~= 0 then
        return npairs.esc("<cr>")
      else
        return npairs.autopairs_cr()
      end
    end

    remap("i", "<C-Space>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
  end,
}
