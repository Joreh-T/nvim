local diffview_open = false -- 状态标志
local diffviewFileHistory_open = false -- 状态标志
-- 定义切换函数
local function toggle_diffview()
  if diffview_open then
    vim.cmd("DiffviewClose") -- 如果已打开，则关闭
    diffview_open = false
  else
    vim.cmd("DiffviewOpen") -- 如果未打开，则打开
    diffview_open = true
  end
end

local function toggle_history_view()
  if diffviewFileHistory_open then
    vim.cmd("DiffviewClose") -- 如果已打开，则关闭
    diffviewFileHistory_open = false
  else
    vim.cmd("DiffviewFileHistory") -- 如果未打开，则打开
    diffviewFileHistory_open = true
  end
end

return {
  -- git blame
  {
    "APZelos/blamer.nvim",
    config = function()
      -- 启用 Blamer
      vim.g.blamer_enabled = true
      vim.g.blamer_delay = 500
    end,
  },
  -- diffview

  {
    "sindrets/diffview.nvim",
    opts = function(_, opts)
      local actions = require("diffview.actions")

      -- 覆盖默认的快捷键映射
      opts.keymaps = {
        view = {
          ["<leader>e"] = actions.toggle_files, { desc = "Toggle the file panel" }
        },
        file_panel = {
          ["<leader>e"] = actions.toggle_files, { desc = "Toggle the file panel" }
        },
        file_history_panel = {
          ["<leader>e"] = actions.toggle_files, { desc = "Toggle the file panel" }
        },
      }

      -- 移除 `<leader>b` 键位（如果默认存在）
      opts.keymaps.view["<leader>b"] = nil
      opts.keymaps.file_panel["<leader>b"] = nil
      opts.keymaps.file_history_panel["<leader>b"] = nil

      return opts -- 返回修改后的配置
    end,

    vim.keymap.set("n", "<leader>gd", toggle_diffview, { noremap = true, silent = true, desc = "Toggle Diffview" }),
    vim.keymap.set(
      "n",
      "<leader>gH",
      toggle_history_view,
      { noremap = true, silent = true, desc = "Toggle File History" }
    ),
  },
}
