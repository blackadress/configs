-- NVIM-TREE
require "nvim-tree".setup {
  disable_netrw = true,
  hijack_netrw = false,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  -- auto_close = false,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {}
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500
  },
  system_open = {
    cmd = nil,
    args = {}
  },
  view = {
    width = 25,
    side = "left",
    mappings = {
      custom_only = false,
      list = {}
    }
  },
  -- ignore = {".git", "node_modules", ".cache"}
}

vim.api.nvim_set_keymap("n", "<F4>", ":NvimTreeToggle<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<Leader>r", ":NvimTreeRefresh<CR>", {})
-- vim.api.nvim_set_keymap("n", "<Leader>n", ":NvimTreeFindFile<CR>", {silent = true})
-- local tree_cb = require "nvim-tree.config".nvim_tree_callback
-- vim.g.nvim_tree_bindings = {
--   ["sv"] = tree_cb("vsplit"),
--   ["sa"] = tree_cb("split")
-- }
