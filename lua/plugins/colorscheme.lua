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
        locoal_white = "#BABAE5",
        locoal_orange = "#F8957B",
        local_light_purple = "#E0CAFB",
        dir_color = "#90a4ae",
      },
      themes = function(colors)
        return {
          Statement = { fg = colors.locoal_orange }, -- 将 Statement 的颜色改为 cyan
          Operator = { fg = colors.locoal_white },
          Macro = { fg = colors.pink },
          Directory = { fg = colors.dir_color },
          ["@lsp.type.macro"] = { fg = colors.locoal_white },
          ["@variable"] = { fg = colors.locoal_white },
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

