-- galaxy line
local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = {"LuaTree", "vista", "dbui"}

local colors = {
  bg = "#282c34",
  yellow = "#cd9e23",
  cyan = "#2aa198",
  darkblue = "#073642",
  orange = "#cb4b16",
  purple = "#6c71c4",
  grey = "#c0c0c0",
  red = "#dc322f",
  blue = "#004c8c",
  mid_blue = "#081633",
}

local separators = {
  slanted_right = "",
  slanted_left = "",
  block_full = "█",
  block_half = "▋"
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    provider = function()
      return " "
    end,
    highlight = {colors.yellow, colors.blue}
  }
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        v = "VISUAL",
        V = "VISUAL LINE",
        [""] = "VISUAL BLOCK"
      }
      return alias[vim.fn.mode()]
    end,
    separator = separators.block_full .. " ",
    separator_highlight = {
      colors.blue,
      function()
        if not buffer_not_empty() then
          return colors.blue
        end
        return colors.darkblue
      end
    },
    highlight = {colors.yellow, colors.blue, "bold"}
  }
}
gls.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.darkblue}
  }
}
gls.left[4] = {
  FileName = {
    provider = {"FileName", "FileSize"},
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {colors.blue, colors.darkblue},
    highlight = {colors.cyan, colors.darkblue}
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function()
      return "  "
    end,
    condition = buffer_not_empty,
    highlight = {colors.orange, colors.blue}
  }
}
gls.left[6] = {
  GitBranch = {
    provider = "GitBranch",
    condition = buffer_not_empty,
    highlight = {colors.grey, colors.blue}
  }
}

local checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.cyan, colors.blue}
  }
}
gls.left[8] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.purple, colors.blue}
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.red, colors.blue}
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function()
      return separators.slanted_left
    end,
    separator = " ",
    separator_highlight = {colors.blue, colors.darkblue},
    highlight = {colors.blue, colors.blue}
  }
}
gls.left[11] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = {colors.red, colors.bg}
  }
}
gls.left[12] = {
  Space = {
    provider = function()
      return ""
    end
  }
}
gls.left[13] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = {colors.yellow, colors.darkblue}
  }
}
gls.left[14] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.darkblue}
  }
}
gls.mid[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' LSP:',
    highlight = {colors.cyan,colors.mid_blue,'bold'}
  }
}
gls.right[1] = {
  FileFormat = {
    provider = "FileFormat",
    separator = " ",
    separator_highlight = {colors.mid_blue, colors.blue},
    highlight = {colors.grey, colors.blue}
  }
}
gls.right[2] = {
  LineInfo = {
    provider = "LineColumn",
    separator = " | ",
    separator_highlight = {colors.orange, colors.blue},
    highlight = {colors.grey, colors.blue}
  }
}
gls.right[3] = {
  PerCent = {
    provider = "LinePercent",
    separator = " ",
    separator_highlight = {colors.darkblue, colors.blue},
    highlight = {colors.grey, colors.darkblue}
  }
}
gls.right[4] = {
  ScrollBar = {
    provider = "ScrollBar",
    highlight = {colors.yellow, colors.blue}
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = "FileTypeName",
    separator = " ",
    separator_highlight = {colors.blue, colors.bg},
    highlight = {colors.grey, colors.blue}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    separator = " ",
    separator_highlight = {colors.blue, colors.bg},
    highlight = {colors.grey, colors.blue}
  }
}
