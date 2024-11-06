return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 30, -- 设置窗口宽度为 30 列
        title = "", -- 隐藏窗口标题
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- 显示隐藏文件
        },
        window = {
          title = "", -- 隐藏文件系统窗口标题
        },
      },
      default_component_configs = {
        icon = {
          -- 自定义文件夹图标
          --   folder_closed = "",
          folder_closed = "", -- 文件夹关闭图标
          folder_open = "",
          provider = function(icon, node, state)
            if node.type == "file" or node.type == "terminal" then
              local success, web_devicons = pcall(require, "nvim-web-devicons")
              local name = node.type == "terminal" and "terminal" or node.name
              if success then
                local devicon, hl = web_devicons.get_icon(name)
                icon.text = devicon or icon.text
                icon.highlight = hl or icon.highlight
              end
            end
          end,
          -- 自定义高亮颜色
          default = "*",
          highlight = "NeoTreeFileIcon", -- 为文件图标定义高亮
        },
      },
      -- 自定义高亮颜色
      config = function()
        -- 自定义文件夹图标颜色
        vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#CD2626" }) -- 文件图标颜色
        vim.api.nvim_set_hl(0, "NeoTreeFolderIcon", { fg = "#CD2626" }) -- 文件夹图标颜色
      end,
    },
  },
}
