-- NVIM-TREE
require "nvim-tree".setup {
  disable_netrw = false,
  -- hijack netrw window on startup
  hijack_netrw = false,
  open_on_setup = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup = {},
  auto_close = true,
  open_on_tab = false,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor = true,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd = false,
  lsp_diagnostics = true,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    enable = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    args = {}
  },
  view = {
    width = 25,
    side = "left",
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      list = {}
    }
  },
  ignore = {".git", "node_modules", ".cache"}
}
-- local glob = vim.g
-- glob.nvim_tree_auto_ignore_ft = {"startify", "dashboard"} -- "empty by default, don't auto open tree on specific filetypes.
-- glob.nvim_tree_indent_markers = 1 -- "0 by default, this option shows indent markers when folders are open
-- glob.nvim_tree_git_hl = 1 -- "0 by default, will enable file highlight for git attributes (can be used without the icons).
-- glob.nvim_tree_add_trailing = 1 -- "0 by default, append a trailing slash to folder names
-- glob.nvim_tree_group_empty = 1 -- " 0 by default, compact folders that only contain a single folder into one node in the file tree
-- glob.nvim_tree_disable_window_picker = 1 -- "0 by default, will disable the window picker.
-- glob.nvim_tree_special_files = {"README.md", "Makefile", "MAKEFILE"} -- " List of filenames that gets highlighted with NvimTreeSpecialFile

vim.api.nvim_set_keymap("n", "<F4>", ":NvimTreeToggle<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<Leader>r", ":NvimTreeRefresh<CR>", {})
-- vim.api.nvim_set_keymap("n", "<Leader>n", ":NvimTreeFindFile<CR>", {silent = true})
-- local tree_cb = require "nvim-tree.config".nvim_tree_callback
-- vim.g.nvim_tree_bindings = {
--   ["sv"] = tree_cb("vsplit"),
--   ["sa"] = tree_cb("split")
-- }
