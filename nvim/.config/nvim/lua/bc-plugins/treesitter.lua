return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  branch = "main",
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter-refactor",
    -- "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter").setup()
    require("nvim-treesitter").install({
      "bash",
      "c",
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
      "rust",
      "javascript",
      "zig",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "<filetype>" },
      callback = function()
        vim.treesitter.start()
      end,
    })

    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    -- require("nvim-treesitter.configs").setup({
    --   ensure_installed = {
    --     "bash",
    --     "c",
    --     "c_sharp",
    --     "css",
    --     "go",
    --     "gomod",
    --     "html",
    --     "http",
    --     "javascript",
    --     "json",
    --     "lua",
    --     "markdown",
    --     "markdown_inline",
    --     "org",
    --     "query",
    --     "rust",
    --     "sql",
    --     "svelte",
    --     "typescript",
    --     "vim",
    --     "yaml",
    --   },
    --   auto_install = true,
    --   autopairs = { enable = true },
    --   autotag = { enable = true },
    --   highlight = {
    --     enable = true,
    --     disable = function(lang, buf)
    --       local max_filesize = 220 * 1024 -- 220 KB
    --       local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --       if ok and stats and stats.size > max_filesize then
    --         return true
    --       end
    --     end,
    --   },
    --   indent = {
    --     enable = true,
    --   },
    --   refactor = {
    --     highlight_definitions = { enable = true },
    --     smart_rename = {
    --       enable = false,
    --       keymaps = {
    --         smart_rename = "trr",
    --       },
    --     },
    --   },
    --   incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --       init_selection = "gnn",
    --       node_decremental = "grm",
    --       node_incremental = "grn",
    --       scope_incremental = "grc",
    --     },
    --   },
    --   playground = {
    --     enable = true,
    --     disable = {},
    --     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    --     persist_queries = false, -- Whether the query persists across vim sessions
    --     keybindings = {
    --       toggle_query_editor = "o",
    --       toggle_hl_groups = "i",
    --       toggle_injected_languages = "t",
    --       toggle_anonymous_nodes = "a",
    --       toggle_language_display = "I",
    --       focus_language = "f",
    --       unfocus_language = "F",
    --       update = "R",
    --       goto_node = "<cr>",
    --       show_help = "?",
    --     },
    --   },
    -- })

    -- vim.api.nvim_command("set foldlevel=20")
    -- vim.api.nvim_command("set foldmethod=expr")
    -- vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
  end,
}
