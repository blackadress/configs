-- VIMWIKI
vim.api.nvim_set_var("vimwiki_list", { { path = "~/Documents/vimwiki/" } })

-- require'neuron'.setup {
--     virtual_titles = true,
--     mappings = true,
--     run = nil, -- function to run when in neuron dir
--     neuron_dir = "~/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
--     leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
-- }

-- require("nerveux").setup({
--   neuron_dir = "/home/erland/neuron",
--   use_cache = true,
--   create_default_mappings = false,
-- })
--
-- vim.keymap.set({ "n" }, "gzz", function()
--   require("nerveux.search").search_zettel({})
-- end, { noremap = true, silent = true })
--
-- vim.keymap.set({ "n" }, "gzb", function()
--   require("nerveux.search").search_zettel({
--     backlinks_of = require("nerveux.utils").get_zettel_id_from_fname(),
--     prompt = "Search Backlinks",
--   })
-- end, { noremap = true, silent = true })
--
-- vim.keymap.set({ "n" }, "gzu", function()
--   require("nerveux.search").search_zettel({
--     uplinks_of = require("nerveux.utils").get_zettel_id_from_fname(),
--     prompt = "Search Uplinks",
--   })
-- end, { noremap = true, silent = true })
--
-- vim.keymap.set({ "n" }, "gzn", function()
--   require("nerveux").new_zettel()
-- end, { noremap = true, silent = true })
--
-- vim.keymap.set({ "n" }, "gzs", function()
--   require("nerveux.search").grep_zettels()
-- end, { noremap = true, silent = true })
--
-- vim.keymap.set({ "n" }, "gzl", function()
--   require("nerveux").insert_last_zettel_id(false)
-- end, { noremap = true, silent = true })
--
-- vim.keymap.set({ "n" }, "gzL", function()
--   require("nerveux").insert_last_zettel_id(true)
-- end, { noremap = true, silent = true })
--
-- vim.keymap.set({ "n" }, "<CR>", function()
--   require("nerveux").open_zettel_under_cursor()
-- end, { noremap = true, silent = true })
--
-- vim.keymap.set({ "n" }, "gz?", function()
--   require("nerveux.help").show_help()
-- end, { noremap = true, silent = true })

local obsidian = require('obsidian')

obsidian.setup({
  dir = "~/.obsidian-vaults/Inicial",
  completion = {
    nvim_cmp = true,
  }
})
