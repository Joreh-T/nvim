return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,  -- 启用插件
        max_lines = 3,  -- 上下文窗口的最大行数
        patterns = {    -- 定义支持的语言的匹配模式
          default = {
            "class",
            "function",
            "method",
          },
        },
      }
    end,
  },
}

