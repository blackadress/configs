-- TREESITTER
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c_sharp",
    "css",
    "go",
    "gomod",
    "html",
    "http",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "org",
    "query",
    "rust",
    "sql",
    "svelte",
    "typescript",
    "vim",
    "yaml",
  },
  autopairs = { enable = true },
  autotag = { enable = true },
  highlight = {
    enable = true,
    disable = { "html", "http" },
  },
  indent = {
    enable = true,
  },
  refactor = {
    highlight_definitions = { enable = true },
    smart_rename = {
      enable = false,
      keymaps = {
        smart_rename = "trr",
      },
    },
  },
  auto_install = true,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_decremental = "grm",
      node_incremental = "grn",
      scope_incremental = "grc",
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
})

vim.api.nvim_command("set foldlevel=20")
vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
