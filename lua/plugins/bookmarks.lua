return {
  "crusj/bookmarks.nvim",
  keys = {
    { "<tab><tab>", mode = { "n" } },
  },
  branch = "main",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    require("bookmarks").setup({
      width = 0.8, -- Bookmarks window width:  (0, 1]
      height = 0.7, -- Bookmarks window height: (0, 1]
      preview_ratio = 0.42, -- Bookmarks preview window ratio (0, 1]
      tags_ratio = 0.07, -- Bookmarks tags window ratio
      fix_enable = false, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.

      virt_text = "", -- Show virt text at the end of bookmarked lines, if it is empty, use the description of bookmarks instead.
      sign_icon = "📑", -- if it is not empty, show icon in signColumn.
      virt_pattern = { "*.go", "*.lua", "*.sh", "*.php", "*.rs", "*.c", "*.cpp", "*.h", "*.hpp", "*.py", "*.xml", "*.yaml", "*.xml", "*.html"}, -- Show virt text only on matched pattern
      virt_ignore_pattern = {}, -- Ignore showing virt text on matched pattern, this works after virt_pattern
      border_style = "rounded", -- 可选："single", "double", "rounded"
      hl = {
        -- border = "CustomBorder", -- 使用自定义高亮组设置边框颜色
        cursorline = "guibg=Gray guifg=White", -- 游标行高亮
      },
      datetime_format = "%Y.%m.%d %H:%M", -- os.date
      -- •%Y: Four-digit year
      -- •%m: Two-digit month (01 to 12)
      -- •%d: Two-digit day (01 to 31)
      -- •%H: Hour in 24-hour format (00 to 23)
      -- •%I: Hour in 12-hour format (01 to 12)
      -- •%M: Two-digit minute (00 to 59)
      -- •%S: Two-digit second (00 to 59)
      -- •%p: AM/PM indicator
    })
    require("telescope").load_extension("bookmarks")
    --INFO_N: vim.api.nvim_set_hl(0, "CustomBorder", { fg = "#56b6c2"} )
  end,
}
