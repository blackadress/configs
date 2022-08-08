-- GITSIGNS
-- You can define these with he highlight command. Somethling like this should work.
require("gitsigns").setup({
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
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })
    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    -- Actions
    map({ "n", "v" }, "<leader>;s", gs.stage_hunk)
    map({ "n", "v" }, "<leader>;r", gs.reset_hunk)
    map("n", "<leader>;S", gs.stage_buffer)
    map("n", "<leader>;u", gs.undo_stage_hunk)
    map("n", "<leader>;R", gs.reset_buffer)
    map("n", "<leader>;p", gs.preview_hunk)
    map("n", "<leader>;b", function()
      gs.blame_line({ full = true })
    end)
    map("n", "<leader>;d", gs.diffthis)
    map("n", "<leader>;D", function()
      gs.diffthis("~")
    end)

    -- Text object
    --
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
})
