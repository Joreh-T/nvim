local enable = 1000
local disable = 50

return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = disable, -- defautl 50, make it higher to fast load
    -- toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
    opts = {
      style = "warm", -- 主题风格：'dark'（或其他选项）
      --   transparent = false,     -- 是否启用透明背景
      --   term_colors = false,      -- 是否调整终端颜色
      --   ending_tildes = false,   -- 是否显示缓冲区末尾的波浪符
    },
    -- load colorscheme directly
    -- config = function()
    --   vim.cmd([[colorscheme onedark]])
    -- end,
  },

  {
    "cpea2506/one_monokai.nvim",
    lazy = false,
    priority = enable, -- defautl 50, make it higher to fast load

    opts = {
      -- 其他设置
      transparent = false,
      colors = {
        local_white = "#C2C7E5",
        local_orange = "#F8957B",
        local_light_purple = "#E0CAFB",
        dir_color = "#cccccc",
        type_pr_color = "#79C5C3",
        var_color = "#F1AFF5",
        var_color_2 = "#C6C2C2",
        delimiter_color = "#bbbbbb",
        string_color = "#DFCF9A",
        float_color_bg = "#21242C", -- #21252b
        float_color_fg = "#B0C996", 
        type_comment_color = "#879FA7",
        -- float_color_fg = "#91A4C4", 
      },
      themes = function(colors)
        return {
          Statement = { fg = colors.local_orange },
          Operator = { fg = colors.pink },
          Macro = { fg = colors.pink },
          Directory = { fg = colors.dir_color },
          String = { fg = colors.string_color },
          Structure = { fg = colors.orange },
          NormalFloat = {fg = colors.float_color_fg, bg = colors.float_color_bg},
          Delimiter = { fg = colors.delimiter_color }, -- 分隔符符号:“;”
          ["@lsp.type.comment"] = { fg = colors.type_comment_color}, -- c/cpp中宏控制的未启用的代码
          ["@lsp.type.macro"] = { fg = colors.local_white },
          ["@lsp.type.property"] = { fg = colors.type_pr_color},
          ["@variable"] = { fg = colors.var_color_2 },
        }
      end,
    },
  },

  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = disable, -- defautl 50, make it higher to fast load
  },

  -- load colorscheme by lazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "one_monokai",
    },
  },
}

