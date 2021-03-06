local gl = require('galaxyline')
local utils = require('utils')

local gls = gl.section
gl.short_line_list = { 'defx', 'packager', 'vista', 'NvimTree' }

-- Colors
local colors = {
  bg = '#282a36',
  fg = '#f8f8f2',
  section_bg = '#38393f',
  yellow = '#f1fa8c',
  cyan = '#8be9fd',
  green = '#50fa7b',
  orange = '#ffb86c',
  magenta = '#ff79c6',
  blue = '#8be9fd',
  red = '#ff5555'
}

-- Local helper functions
local buffer_not_empty = function()
  return not utils.is_buffer_empty()
end

local checkwidth = function()
  return utils.has_width_gt(40) and buffer_not_empty()
end

local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  return mode_colors[vim.fn.mode()]
end

-- Left side
gls.left[1] = {
  FirstElement = {
    provider = function() return '▋' end,
    highlight = { colors.cyan, colors.section_bg },
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg},
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.magenta, i = colors.green,v=colors.blue,
                          [''] = colors.blue,V=colors.blue,
                          c = colors.red,no = colors.magenta,s = colors.orange,
                          S=colors.orange,[''] = colors.orange,
                          ic = colors.yellow,R = colors.purple,Rv = colors.purple,
                          cv = colors.red,ce=colors.red, r = colors.cyan,
                          rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return '  '
    end,
    highlight = { colors.bg, colors.bg },
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {colors.bg, colors.section_bg},
  },
}
gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
  },
}
gls.left[4] = {
  FileName = {
    provider = { 'FileName', 'FileSize' },
    condition = buffer_not_empty,
    highlight = { colors.fg, colors.section_bg },
    separator = "",
    separator_highlight = {colors.section_bg, colors.bg},
  }
}
gls.left[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    -- condition = buffer_not_empty,
    highlight = {colors.red,colors.bg},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    separator = " ",
    separator_highlight = {colors.fg, colors.bg},
    -- condition = buffer_not_empty,
    highlight = {colors.fg,colors.bg},
  }
}
gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.green, colors.bg },
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.orange, colors.bg },
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = { colors.red,colors.bg },
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return '' end,
    condition = buffer_not_empty,
    -- separator = ' ',
    -- separator_highlight = { colors.section_bg, colors.section_bg },
    highlight = {colors.section_bg,colors.bg}
  }
}
gls.left[11] = {
  Space = {
    provider = function () return ' ' end,
    condition = buffer_not_empty,
    highlight = {colors.section_bg,colors.section_bg},
  }
}
gls.left[12] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    condition = buffer_not_empty,
    icon = '  ',
    highlight = {colors.red,colors.section_bg}
  }
}
-- gls.left[13] = {
--   Space = {
--     provider = function () return ' ' end,
--     condition = buffer_not_empty,
--     highlight = {colors.section_bg,colors.section_bg},
--   }
-- }
gls.left[14] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    condition = buffer_not_empty,
    icon = '  ',
    highlight = {colors.orange,colors.section_bg},
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}
-- gls.left[17] = {
--   Space = {
--     provider = function () return ' ' end,
--     condition = buffer_not_empty,
--     highlight = {colors.section_bg,colors.section_bg},
--     separator = ' ',
--     separator_highlight = { colors.section_bg, colors.bg },
--   }
-- }

-- Right side
gls.right[1]= {
  FileFormat = {
    provider = function() return vim.bo.filetype end,
    highlight = { colors.fg,colors.section_bg },
    separator = '',
    separator_highlight = { colors.section_bg,colors.bg },
  }
}
gls.right[2] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = { colors.fg, colors.section_bg },
    separator = ' | ',
    separator_highlight = { colors.bg, colors.section_bg },
  },
}
gls.right[3] = {
  Icon = {
    provider = function() return ' ' end,
    highlight = { colors.red, colors.section_bg },
    separator = ' | ',
    separator_highlight = { colors.bg, colors.section_bg },
  }
}

-- Short status line
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    highlight = { colors.white, colors.section_bg },
    condition = buffer_not_empty,
    separator = "",
    separator_highlight = {colors.section_bg, colors.bg},
  }
}
-- gls.short_line_left[2] = {
--   Space = {
--     separator = '',
--     separator_highlight = { colors.section_bg, colors.bg },
--     condition = buffer_not_empty,
--     highlight = {colors.section_bg,colors.bg},
--   }
-- }

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = { colors.blue, colors.section_bg },
    separator = '',
    separator_highlight = { colors.section_bg, colors.bg },
  }
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
