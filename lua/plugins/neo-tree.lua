return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>E", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
      { "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    opts = {
      window = {
        width = function()
          local total_width = vim.o.columns -- 获取当前窗口总宽度
          return math.max(33, math.floor(total_width * 0.20)) -- 宽度为总宽度的20%，最小为20列
        end,
        title = "", -- 隐藏窗口标题
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- 显示隐藏文件
          -- hide_gitignored = false,
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
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
          -- default = "*",
          -- highlight = "NeoTreeFileIcon", -- 为文件图标定义高亮
        },
        git_status = {
          symbols = {
            -- Change type
            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "󰗨", -- this can only be used in the git_status source
            renamed = "󰁕", -- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
      -- 自定义高亮颜色
      -- config = function()
      --   -- 自定义文件夹图标颜色
      --   vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#CD2626" }) -- 文件图标颜色
      --   vim.api.nvim_set_hl(0, "NeoTreeFolderIcon", { fg = "#CD2626" }) -- 文件夹图标颜色
      -- end,
    },
  },
}
