-- GITSIGNS
-- You can define these with he highlight command. Somethling like this should work.
-- :highlight GitSignsAdd guifg=Blue https://github.com/lewis6991/gitsigns.nvim/issues/169
-- vim.cmd("highlight GitSignsAdd guifg=#2aa198")
-- vim.cmd("highlight GitSignsChange guifg=#6c71c4")
-- vim.cmd("highlight GitSignsDelete guifg=#d33682")
require("gitsigns").setup {
  -- signs = {
  --   add = {
  --     hl = "Constant",
  --     text = "│",
  --     numhl = "Constant",
  --     linehl = "Constant"
  --   },
  --   change = {
  --     hl = "Underlined",
  --     text = "│",
  --     numhl = "Underlined",
  --     linehl = "Underlined"
  --   },
  --   delete = {
  --     hl = "gitCommitBranch",
  --     text = "_",
  --     numhl = "gitCommitBranch",
  --     linehl = "gitCommitBranch"
  --   },
  --   topdelete = {
  --     hl = "WarningMsg",
  --     text = "‾",
  --     numhl = "WarningMsg",
  --     linehl = "WarningMsg"
  --   },
  --   changedelete = {
  --     hl = "GitSignsChange",
  --     text = "~",
  --     numhl = "GitSignsChangeNr",
  --     linehl = "GitSignsChangeLn"
  --   }
  -- },
  signs = {
    add = {hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn"},
    change = {
      hl = "GitSignsChange",
      text = "▎",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn"
    },
    delete = {
      hl = "GitSignsDelete",
      text = "_",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn"
    },
    topdelete = {
      hl = "GitSignsDelete",
      text = "‾",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn"
    },
    changedelete = {
      hl = "GitSignsChange",
      text = "~",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn"
    }
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,
    ["n ]c"] = {
      expr = true,
      '&diff ? \']c\' : \'<cmd>lua require"gitsigns.actions".next_hunk()<CR>\''
    },
    ["n [c"] = {
      expr = true,
      '&diff ? \'[c\' : \'<cmd>lua require"gitsigns.actions".prev_hunk()<CR>\''
    },
    ["n <leader>;s"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["n <leader>;u"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>;r"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["n <leader>;R"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ["n <leader>;p"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n <leader>;b"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    -- Text objects
    ["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  watch_index = {interval = 1000},
  current_line_blame = true,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = true -- If luajit is present
}
