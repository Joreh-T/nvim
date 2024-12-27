return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        -- 新增的 path 分组
        -- {
        --   "<leader>y",
        --   group = "path", -- 定义一个 "path" 分组
        -- },
        { "<leader>y", group = "Yank path", icon = { icon = "󰡰", color = "cyan" } },
        {
          "<leader>yn",
          ':let @+ = expand("%:t")<CR>', -- 快捷键功能
          mode = "n",
          desc = "Yank filename", -- 描述
        },
        {
          "<leader>yr",
          ':let @+ = fnamemodify(expand("%:p"), ":." )<CR>', -- 快捷键功能
          mode = "n",
          desc = "Yank relative path", -- 描述
        },
        {
          "<leader>ya",
          ':let @+ = expand("%:p")<CR>', -- 快捷键功能
          mode = "n",
          desc = "Yank absolute path", -- 描述
        },
      },
      {
        { "<leader>m", group = "Bookmarks", icon = { icon = "", color = "yellow" } },
      },
      {
        { "<leader>i", group = "Get Icons", icon = { icon = "", color = "green" } },
      },
      {
        { "<leader>K", group = "Keyword Manual", icon = { icon = "󰷈", color = "" } },
      },
      {
        { "<leader>r", group = "Restart LSP", icon = { icon = "", color = "red" } },
      },
      {
        { "<leader>a", group = "Add cursors to all the cword", icon = { icon = "󰆾", color = "yellow" } },
      },
    },
  },
}
