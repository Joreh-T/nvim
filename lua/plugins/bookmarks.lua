return {
  "crusj/bookmarks.nvim",
  keys = {
    { "<tab><tab>", mode = { "n" } },
  },
  branch = "main",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    require("bookmarks").setup({
      hl = {
        -- border = "CustomBorder", -- 使用自定义高亮组设置边框颜色
        cursorline = "guibg=Gray guifg=White", -- 游标行高亮
      },
      border_style = "rounded", -- 可选："single", "double", "rounded"
    })
    require("telescope").load_extension("bookmarks")
    -- vim.api.nvim_set_hl(0, "CustomBorder", { fg = "#56b6c2"} )
  end,
}
