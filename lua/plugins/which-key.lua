return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        -- 新增的 path 分组
        {
          "<leader>y", group = "path"  -- 定义一个 "path" 分组
        },
        { "<leader>y", group = "copy path", icon = { icon = "󰡰", color = "cyan" } },
        {
          "<leader>yn",
          ':let @+ = expand("%:t")<CR>',  -- 快捷键功能
          mode = "n",
          desc = "Copy filename"  -- 描述
        },
        {
          "<leader>yr",
          ':let @+ = fnamemodify(expand("%:p"), ":." )<CR>',  -- 快捷键功能
          mode = "n",
          desc = "Copy relative path"  -- 描述
        },
        {
          "<leader>ya",
          ':let @+ = expand("%:p")<CR>',  -- 快捷键功能
          mode = "n",
          desc = "Copy absolute path"  -- 描述
        },
      },
    },
  },
}