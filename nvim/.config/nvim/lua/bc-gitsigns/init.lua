-- GITSIGNS
-- You can define these with he highlight command. Somethling like this should work.
require("gitsigns").setup {
  numhl = true,
  current_line_blame = true,
  sign_priority = 6,
  update_debounce = 100,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>;s', gs.stage_hunk)
    map({'n', 'v'}, '<leader>;r', gs.reset_hunk)
    map('n', '<leader>;S', gs.stage_buffer)
    map('n', '<leader>;u', gs.undo_stage_hunk)
    map('n', '<leader>;R', gs.reset_buffer)
    map('n', '<leader>;p', gs.preview_hunk)
    map('n', '<leader>;b', function() gs.blame_line{full=true} end)
    map('n', '<leader>;d', gs.diffthis)
    map('n', '<leader>;D', function() gs.diffthis('~') end)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end
}
