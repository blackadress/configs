-- NVIM-TREE
local glob = vim.g
glob.nvim_tree_width = 40 -- "30 by default
glob.nvim_tree_ignore = {".git", "node_modules", ".cache"} -- "empty by default
glob.nvim_tree_gitignore = 0 -- "0 by default
glob.nvim_tree_auto_open = 1 -- "0 by default, opens the tree when typing `vim $DIR` or `vim`
glob.nvim_tree_auto_close = 1 -- "0 by default, closes the tree when it's the last window
glob.nvim_tree_auto_ignore_ft = {"startify", "dashboard"} -- "empty by default, don't auto open tree on specific filetypes.
glob.nvim_tree_quit_on_open = 0 -- "0 by default, closes the tree when you open a file
glob.nvim_tree_follow = 1 -- "0 by default, this option allows the cursor to be updated when entering a buffer
glob.nvim_tree_indent_markers = 1 -- "0 by default, this option shows indent markers when folders are open
glob.nvim_tree_hide_dotfiles = 1 -- "0 by default, this option hides files and folders starting with a dot `.`
glob.nvim_tree_git_hl = 1 -- "0 by default, will enable file highlight for git attributes (can be used without the icons).
glob.nvim_tree_highlight_opened_files = 1 -- "0 by default, will enable folder and file icon highlight for opened files/directories.
glob.nvim_tree_root_folder_modifier = ":~" -- "This is the default. See :help filename-modifiers for more options
glob.nvim_tree_tab_open = 1 -- "0 by default, will open the tree when entering a new tab and the tree was previously open
glob.nvim_tree_width_allow_resize = 1 -- "0 by default, will not resize the tree when opening a file
glob.nvim_tree_disable_netrw = 0 -- "1 by default, disables netrw
glob.nvim_tree_hijack_netrw = 0 -- "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
glob.nvim_tree_add_trailing = 1 -- "0 by default, append a trailing slash to folder names
glob.nvim_tree_group_empty = 1 -- " 0 by default, compact folders that only contain a single folder into one node in the file tree
glob.nvim_tree_lsp_diagnostics = 1 -- "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
glob.nvim_tree_disable_window_picker = 1 -- "0 by default, will disable the window picker.
glob.nvim_tree_special_files = {"README.md", "Makefile", "MAKEFILE"} -- " List of filenames that gets highlighted with NvimTreeSpecialFile

vim.api.nvim_set_keymap("n", "<F4>", ":NvimTreeToggle<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<Leader>r", ":NvimTreeRefresh<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>n", ":NvimTreeFindFile<CR>", {silent = true})
local tree_cb = require "nvim-tree.config".nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["sv"] = tree_cb("vsplit"),
  ["sa"] = tree_cb("split")
}
