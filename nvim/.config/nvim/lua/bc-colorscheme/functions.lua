M = {}

function M.colo_tokyo(style)
  vim.g.tokyonight_style = style or "night" --  day, storm or night
  vim.cmd("colorscheme tokyonight")
end

function M.colo_gruvbox_baby(bg, transparent, kw_style, fun_style, var_style)
  vim.g.gruvbox_baby_background_color = bg or "medium" -- "medium" or "dark"
  vim.g.gruvbox_baby_transparent_mode = transparent or false -- "false" or "true"
  vim.g.gruvbox_baby_keyword_style = kw_style or "bold" -- see :h attr-list
  vim.g.gruvbox_baby_function_style = fun_style or "italic" -- see :h attr-list
  vim.g.gruvbox_baby_variable_style = var_style or "NONE" -- see :h attr-list

  vim.cmd("colorscheme gruvbox-baby")
end

function M.colo_gruvbox(bg)
  vim.o.background = bg or "dark" -- "light" or "dark"
  vim.cmd([[colorscheme gruvbox]])
end

function M.colo_gruvbox_material(bg, material_bg, enable_bold, enable_italic, transparent, palette)
  local bg_cmd = string.format("set background=%s", bg or "dark") -- "light" or "dark"
  vim.cmd(bg_cmd)
  vim.g.gruvbox_material_background = material_bg or "medium" -- "soft", "medium" or "hard"
  vim.g.gruvbox_material_enable_bold = enable_bold or 1
  vim.g.gruvbox_material_enable_italic = enable_italic or 1
  vim.g.gruvbox_material_transparent_background = transparent or 0 -- 1 for transparent
  vim.g.gruvbox_material_palette = palette or "mix" -- "material", "mix" or "original"
  vim.cmd([[colorscheme gruvbox-material]])
end

function M.colo_github(theme_style, fun_style, transparent, kw_style)
  require("github-theme").setup({
    theme_style = theme_style or "dark", -- "light_colorblind", "light_default", "light", "dark_colorblind", "dark_default", "dimmed", "dark"
    function_style = fun_style or "bold",
    transparent = transparent or false,
    keyword_style = kw_style or "italic",
  })
end

function M.colo_solarized()
  vim.cmd("colorscheme subtle_dark") -- subtle_light subtle_dark
end

function M.colo_soluarized()
  vim.cmd("colorscheme soluarized")
end

function M.colo_material(it_comments, transparent, mat_style)
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

function M.colo_nebulous(style, it_comments, it_kw, it_fun, it_var)
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

function M.colo_catpuccin(transparent)
  require("catppuccin").setup({
    transparent_background = transparent or false,
  })
  vim.cmd("colorscheme catppuccin")
end

function M.colo_leaf(comm, fun, kw, sttm, type, var, transparent, theme)
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

function M.colo_nightfox(comm, const, kw)
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

function M.colo_reset()
end

return M
