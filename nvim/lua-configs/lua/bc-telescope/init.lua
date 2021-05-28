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
      i = {["<C-j>"] = actions.close},
      n = {["<C-j>"] = actions.close}
    }
  }
}
require("telescope").load_extension("fzy_native") -- Is this even necessary?
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fh", ":Telescope help_tags<CR>", {noremap = true})
