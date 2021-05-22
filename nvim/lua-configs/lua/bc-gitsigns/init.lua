--GITSIGNS
-- You can define these with he highlight command. Somethling like this should work.
-- :highlight GitSignsAdd guifg=Blue https://github.com/lewis6991/gitsigns.nvim/issues/169
-- vim.cmd("highlight GitSignsAdd guifg=#2aa198")
-- vim.cmd("highlight GitSignsChange guifg=#6c71c4")
-- vim.cmd("highlight GitSignsDelete guifg=#d33682")
require("gitsigns").setup {
  signs = {
    add = {hl = "Constant", text = "│", numhl = "Constant", linehl = "Constant"},
    change = {hl = "Underlined", text = "│", numhl = "Underlined", linehl = "Underlined"},
    delete = {hl = "gitCommitBranch", text = "_", numhl = "gitCommitBranch", linehl = "gitCommitBranch"},
    topdelete = {hl = "WarningMsg", text = "‾", numhl = "WarningMsg", linehl = "WarningMsg"},
    changedelete = {hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"}
  },
  numhl = false,
  linehl = false,
  watch_index = {
    interval = 1000
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = true -- If luajit is present
}

