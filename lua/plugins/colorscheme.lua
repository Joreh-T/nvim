local enable = 1000
local disable = 50

local local_colors = require("plugins.colorscheme-base-cfg.onedark-palette")
local onedark_style = "dark"

vim.g.sonokai_style = "atlantis" -- default, atlantis, espresso, maia, andromeda, shusia
return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = enable, -- defautl 50, make it higher to fast load
    -- toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
    opts = {
      style = onedark_style, -- dark, darker, cool, deep, warm, warmer, light
      --   transparent = false,     -- 是否启用透明背景
      term_colors = true, -- 是否调整终端颜色
      ending_tildes = true, -- 是否显示缓冲区末尾的波浪符

      colors = {
        dir_color = "#cccccc",
        delimiter_color = "#bbbbbb",
        keyword_color = "#E47255",
        keyword_conditional_color = "#bb97ee",
        string_color_1 = "#D7D7E0",
        string_color_2 = "#D2E1E4",
        string_color_3 = "#E1E2E3",
        git_untracked_color = "#72cce8",
        var_color_2 = "#C6C2C2",
        var_color_3 = "#E4E3E1",
        purple = "#B98ED2",
        pink = "#e06c75",

        local_white = "#C2C7E5",
        local_light_purple = "#E0CAFB",
        type_pr_color = "#79C5C3",
        var_color = "#F1AFF5",
        float_color_bg = "#21242C", -- #21252b
        float_color_fg = "#B0C996",
        type_comment_color = "#879FA7",
      },

      highlights = {
        TelescopeBorder = { fg = local_colors[onedark_style].cyan },
        DiagnosticHint = { fg = "$keyword_color" },

        Directory = { fg = "$dir_color" },
        Delimiter = { fg = "$delimiter_color" },
        NeoTreeGitUntracked = { fg = "$git_untracked_color" },
        NeoTreeGitConflict = { fg = local_colors[onedark_style].yellow, fmt = "bold,italic" },

        Title = { fg = local_colors[onedark_style].green },
        Special = { fg = "#e6756e" },
        -- ["@tag.delimiter"] = colors.Purple, -- "<", ">"
        ["@function"] = { fg = local_colors[onedark_style].green },
        ["@lsp.typemod.method.defaultLibrary"] = { fg = local_colors[onedark_style].blue },
        ["@lsp.typemod.function.defaultLibrary"] = { fg = local_colors[onedark_style].blue },

        ["@function.macro"] = { fg = local_colors[onedark_style].bg_blue, fmt = "bold" },
        ["@lsp.type.macro"] = { fg = local_colors[onedark_style].bg_blue, fmt = "bold" },

        ["@punctuation.delimiter"] = { fg = "$delimiter_color" },

        ["@keyword"] = { fg = "$keyword_color" },
        ["@keyword.conditional"] = { fg = local_colors[onedark_style].red },

        ["@variable"] = { fg = "$var_color_2" },
        ["@lsp.type.variable"] = { fg = "$var_color_2" },
        ["@variable.parameter"] = {fg = "$purple"},
        ["@lsp.type.parameter"] = {fg = "$purple"},
        -- ["@variable.builtin"] = {fg = "$pink"},

        ["@string"] = { fg = "$string_color_3" },

        ["@operator"] = { fg = "$pink" },
      },
    },
    -- load colorscheme directly
    -- config = function()
    --   vim.cmd([[colorscheme onedark]])
    -- end,
  },

  {
    "cpea2506/one_monokai.nvim",
    lazy = true,
    --   priority = disable, -- defautl 50, make it higher to fast load
    --
    --   opts = {
    --     -- 其他设置
    --     transparent = false,
    --     colors = {
    --       local_white = "#C2C7E5",
    --       local_orange = "#F8957B",
    --       local_light_purple = "#E0CAFB",
    --       dir_color = "#cccccc",
    --       type_pr_color = "#79C5C3",
    --       var_color = "#F1AFF5",
    --       var_color_2 = "#C6C2C2",
    --       delimiter_color = "#bbbbbb",
    --       string_color = "#DFCF9A",
    --       float_color_bg = "#21242C", -- #21252b
    --       float_color_fg = "#B0C996",
    --       type_comment_color = "#879FA7",
    --       -- float_color_fg = "#91A4C4",
    --     },
    --     themes = function(colors)
    --       return {
    --         Statement = { fg = colors.local_orange },
    --         Operator = { fg = colors.pink },
    --         Macro = { fg = colors.pink },
    --         Directory = { fg = colors.dir_color },
    --         String = { fg = colors.string_color },
    --         Structure = { fg = colors.orange },
    --         NormalFloat = { fg = colors.float_color_fg, bg = colors.float_color_bg },
    --         Delimiter = { fg = colors.delimiter_color }, -- 分隔符符号:“;”
    --         ["@lsp.type.comment"] = { fg = colors.type_comment_color }, -- c/cpp中宏控制的未启用的代码
    --         ["@lsp.type.macro"] = { fg = colors.local_white },
    --         ["@lsp.type.property"] = { fg = colors.type_pr_color },
    --         ["@variable"] = { fg = colors.var_color_2 },
    --       }
    --     end,
    --   },
  },
  --
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   lazy = true,
  --   priority = disable, -- defautl 50, make it higher to fast load
  -- },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = enable,
  },

  -- 格式化占位符颜色跟随主题style
  {
    "Joreh-T/placeholder_highlighter.nvim",
    config = function()
      require("placeholder_highlighter").setup({
        fg = "#F6D5A4",
        bold = true,
      })
    end,
  },

  -- load colorscheme by lazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
      -- colorscheme = "one_monokai",
    },
  },
}
