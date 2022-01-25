-- TREESITTER
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "html" }, -- list of language that will be disabled
  },
  incremental_selection = {
    keymaps = {
      init_selection = "gnn",
      node_decremental = "grm",
      node_incremental = "grn",
      scope_incremental = "grc",
    },
  },
})

vim.api.nvim_command("set foldlevel=20")
vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
