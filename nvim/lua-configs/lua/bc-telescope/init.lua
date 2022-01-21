-- TELESCOPE
local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    -- file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true
      }
    },
    mappings = {
      n = {["<C-j>"] = actions.close}
    }
  }
}
require("telescope").load_extension("fzy_native") -- Is this even necessary?
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", {noremap = true})
vim.api.nvim_set_keymap(
  "n",
  "<Leader>ss",
  "<cmd>lua require('telescope.builtin').find_files({no_ignore=true})<CR>",
  {noremap = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>..",
  "<cmd>lua require('telescope.builtin').find_files({hidden=true})<CR>",
  {noremap = true}
)
vim.api.nvim_set_keymap("n", "<Leader>frg", ":Telescope live_grep<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fh", ":Telescope help_tags<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fgb", ":Telescope git_branches<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fgc", ":Telescope git_bcommits<CR>", {noremap = true})
