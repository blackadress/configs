M = {}

function M.tokyo(style)
  vim.g.tokyonight_style = style or "night" --  day, storm or night
  vim.cmd("colorscheme tokyonight")
end

function M.gruvbox_baby(bg, transparent, kw_style, fun_style, var_style)
  vim.g.gruvbox_baby_background_color = bg or "medium" -- "medium" or "dark"
  vim.g.gruvbox_baby_transparent_mode = transparent or false -- "false" or "true"
  vim.g.gruvbox_baby_keyword_style = kw_style or "bold" -- see :h attr-list
  vim.g.gruvbox_baby_function_style = fun_style or "italic" -- see :h attr-list
  vim.g.gruvbox_baby_variable_style = var_style or "NONE" -- see :h attr-list

  vim.cmd("colorscheme gruvbox-baby")
end

function M.gruvbox(bg)
  vim.o.background = bg or "dark" -- "light" or "dark"
  vim.cmd([[colorscheme gruvbox]])
end

function M.gruvbox_material(bg, material_bg, enable_bold, enable_italic, transparent, palette)
  local bg_cmd = string.format("set background=%s", bg or "dark") -- "light" or "dark"
  vim.cmd(bg_cmd)
  vim.g.gruvbox_material_background = material_bg or "medium" -- "soft", "medium" or "hard"
  vim.g.gruvbox_material_enable_bold = enable_bold or 1
  vim.g.gruvbox_material_enable_italic = enable_italic or 1
  vim.g.gruvbox_material_transparent_background = transparent or 0 -- 1 for transparent
  vim.g.gruvbox_material_palette = palette or "mix" -- "material", "mix" or "original"
  vim.cmd([[colorscheme gruvbox-material]])
end

function M.github(theme_style, fun_style, transparent, kw_style)
  require("github-theme").setup({
    theme_style = theme_style or "dark", -- "light_colorblind", "light_default", "light", "dark_colorblind", "dark_default", "dimmed", "dark"
    function_style = fun_style or "bold",
    transparent = transparent or false,
    keyword_style = kw_style or "italic",
  })
end

function M.soluarized()
  vim.cmd("colorscheme soluarized")
end

function M.material(it_comments, transparent, mat_style)
  require("material").setup({
    italics = {
      comments = it_comments or true,
    },
    custom_highlight = {
      -- CursorLine = '#0000FF',
      -- LineNr = '#FFFFFF'
    },
    disable = {
      background = transparent or false,
    },
  })
  vim.g.material_style = mat_style or "oceanic" -- "lighter", "palenight", "oceanic", "deep ocean", "darker"
  vim.cmd("colorscheme material")
end

function M.nebulous(style, it_comments, it_kw, it_fun, it_var)
  require("nebulous").setup({
    variant = style or "fullmoon", -- "night", "twilight", "midnight", "fullmoon" or "quasar"
    disable = {
      background = false,
      endOfBuffer = false,
      terminal_colors = false,
    },
    italic = {
      comments = it_comments or true,
      keywords = it_kw or false,
      functions = it_fun or false,
      variables = it_var or false,
    },
    custom_colors = { -- this table can hold any group of colors with their respective values
      -- LineNr = { fg = "#5BBBDA", bg = "NONE", style = "NONE" },
      -- CursorLineNr = { fg = "#E1CD6C", bg = "NONE", style = "NONE" },

      -- it is possible to specify only the element to be changed
      -- TelescopePreviewBorder = { fg = "#A13413" },
      -- LspDiagnosticsDefaultError = { bg = "#E11313" },
      TSTagDelimiter = { style = "bold,italic" },
    },
  })
end

function M.catpuccin(transparent)
  require("catppuccin").setup({
    transparent_background = transparent or false,
  })
  vim.cmd("colorscheme catppuccin")
end

function M.leaf(comm, fun, kw, sttm, type, var, transparent, theme)
  require("leaf").setup({
    undercurl = true,
    commentStyle = comm or "italic",
    functionStyle = fun or "NONE",
    keywordStyle = kw or "italic",
    statementStyle = sttm or "bold",
    typeStyle = type or "NONE",
    variablebuiltinStyle = var or "italic",
    transparent = transparent or false,
    colors = {},
    overrides = {},
    theme = theme or "dark", -- default, alternatives: "light", "dark", "lighter", "darker", "lightest", "darkest"
  })

  -- setup must be called before loading
  vim.cmd("colorscheme leaf")
end

function M.nightfox(comm, const, kw)
  require("nightfox").setup({
    options = {
      styles = {
        comments = comm or "italic",
        constants = const or "bold",
        keywords = kw or "bold",
      },
    },
  })

  vim.cmd("colorscheme nightfox")
end

function M.articblush(code, comm_it, contrast)
  require("articblush").setup({
    italics = {
      code = code or true,
      comments = comm_it or true, -- to disable italic comments, replace to true to enable
    },
    nvim_tree = {
      contrast = contrast or true,
    },
  })
end

function M.challenger_deep()
  vim.cmd("colorscheme challenger_deep")
end

function M.space_dark()
  vim.cmd("colorscheme space-vim-dark")
end

function M.edge()
  vim.g.edge_style = "neon"
  vim.g.edge_better_performance = 1
  vim.cmd("colorscheme edge")
end

function M.horizon()
  vim.cmd("colorscheme horizon")
end

function M.solarized()
  -- subtle_solo
  vim.cmd("colorscheme subtle_dark") -- subtle_light subtle_dark
end

function M.flattened()
  vim.cmd("colorscheme flattened_dark")
end

function M.eva()
  vim.cmd("colorscheme eva01") -- eva01-LCL
end

function M.deep_space()
  vim.g.deepspace_italics = 1
  vim.cmd("colorscheme deep-space")
end

function M.dogrun()
  vim.cmd("colorscheme dogrun")
end

function M.afterglow()
  vim.cmd("colorscheme afterglow")
end

function M.deus()
  vim.cmd("colorscheme deus")
end

function M.hybrid()
  -- vim.g.hybrid_reduced_contrast = 1 -- Remove this line if using the default palette.
  -- vim.g.hybrid_custom_term_colors = 1
  vim.cmd("colorscheme hybrid")
end

function M.reset() end

return M
