return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>E", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
      { "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    opts = function(_, opts)
      -- vim.diagnostic.config({
      --   signs = {
      --     text = {
      --       [vim.diagnostic.severity.ERROR] = '',
      --       [vim.diagnostic.severity.WARN] = '',
      --       [vim.diagnostic.severity.INFO] = '',
      --       [vim.diagnostic.severity.HINT] = '󰌵',
      --     },
      --   }
      -- })
     opts.default_component_configs.diagnostics = {
        enabled = false, -- 禁用诊断图标
      }
      -- 修改窗口宽度
      opts.window = opts.window or {}
      opts.window.width = function()
        local total_width = vim.o.columns
        return math.max(33, math.floor(total_width * 0.20))
      end
      opts.window.title = ""

      -- 修改文件系统窗口标题
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}
      opts.filesystem.filtered_items.hide_dotfiles = false
      opts.filesystem.filtered_items.follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      }
      opts.filesystem.window = { title = "" }
      -- 修改图标配置
      opts.default_component_configs = opts.default_component_configs or {}
      opts.default_component_configs.icon = {
        folder_closed = "",
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
      }
      opts.default_component_configs.modified = {
        symbol = "● ",
        highlight = "NeoTreeGitModified",
      }
      opts.default_component_configs.git_status = {
        symbols = {
          added = "",
          modified = "",
          deleted = "󰗨",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      }
      return opts
    end,
  },
}
