-- NVIM-TREE
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 25,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
})

vim.api.nvim_set_keymap("n", "<F4>", ":NvimTreeToggle<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>r", ":NvimTreeRefresh<CR>", {})
-- vim.api.nvim_set_keymap("n", "<Leader>n", ":NvimTreeFindFile<CR>", {silent = true})
-- local tree_cb = require "nvim-tree.config".nvim_tree_callback
-- vim.g.nvim_tree_bindings = {
--   ["sv"] = tree_cb("vsplit"),
--   ["sa"] = tree_cb("split")
-- }
