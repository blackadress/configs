return {
  {
    "vimwiki/vimwiki",
    config = function()
      vim.api.nvim_set_var("vimwiki_list", { { path = "/home/erland/Documents/vimwiki/" } })
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "godlygeek/tabular",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local obsidian = require("obsidian")

      obsidian.setup({
        dir = "~/.obsidian-vaults/Inicial",
        completion = {
          nvim_cmp = true,
        },
      })
    end,
  },
}
