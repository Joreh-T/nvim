return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    keymaps = {
      up_and_jump = "<up>",
      down_and_jump = "<down>",
    },
    outline_window = {
      position = "right",
      split_command = nil,
      width = 18, -- 设置默认宽度为最小值
      -- relative_width = true,
      wrap = false,
      focus_on_open = true,
      auto_close = false,
      auto_jump = false,
      show_numbers = false,
      show_relative_numbers = false,
      ---@type boolean|string?
      show_cursorline = true,
      hide_cursor = false,
      winhl = "",
      jump_highlight_duration = 400,
      center_on_jump = true,
    },
    preview_window = {
      -- Border option for floating preview window.
      -- Options include: single/double/rounded/solid/shadow or an array of border
      -- characters.
      -- See :help nvim_open_win() and search for "border" option.
      border = "rounded",
      -- Experimental feature that let's you edit the source content live
      -- in the preview window. Like VS Code's "peek editor".
      live = true,
    },
    symbols = {
      ---@type outline.FilterConfig?
      filter = nil,
      icon_source = nil,
      icon_fetcher = nil,
      icons = {
        File = { icon = "󰈔", hl = "Identifier" },
        Module = { icon = "󰆧", hl = "Include" },
        Namespace = { icon = "󰅪", hl = "Include" },
        Package = { icon = "󰏗", hl = "Include" },
        Class = { icon = "𝓒", hl = "Type" },
        Method = { icon = "", hl = "Function" },
        Property = { icon = "", hl = "Identifier" },
        Field = { icon = "󰆨", hl = "Identifier" },
        Constructor = { icon = "", hl = "Special" },
        Enum = { icon = "ℰ", hl = "Type" },
        Interface = { icon = "󰜰", hl = "Type" },
        Function = { icon = "ƒ", hl = "Function" },
        Variable = { icon = "", hl = "Constant" },
        Constant = { icon = "", hl = "Constant" },
        String = { icon = "𝓐", hl = "String" },
        Number = { icon = "#", hl = "Number" },
        Boolean = { icon = "⊨", hl = "Boolean" },
        Array = { icon = "󰅪", hl = "Constant" },
        Object = { icon = "⦿", hl = "Type" },
        Key = { icon = "🔐", hl = "Type" },
        Null = { icon = "NULL", hl = "Type" },
        EnumMember = { icon = "", hl = "Identifier" },
        Struct = { icon = "𝓢", hl = "Structure" },
        Event = { icon = "🗲", hl = "Type" },
        Operator = { icon = "+", hl = "Identifier" },
        TypeParameter = { icon = "𝙏", hl = "Identifier" },
        Component = { icon = "󰅴", hl = "Function" },
        Fragment = { icon = "󰅴", hl = "Constant" },
        -- ccls
        TypeAlias = { icon = " ", hl = "Type" },
        Parameter = { icon = " ", hl = "Identifier" },
        StaticMethod = { icon = " ", hl = "Function" },
        Macro = { icon = " ", hl = "Function" },
      },
    },
  },
  config = function(_, opts)
    -- 初始化 outline.nvim 配置
    require("outline").setup(opts)

    -- 动态调整宽度逻辑
    vim.api.nvim_create_autocmd("VimResized", {
      callback = function()
        local outline_buf = nil

        -- 找到 outline 缓冲区和窗口
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[buf].filetype == "Outline" then
            outline_buf = buf
            break
          end
        end

        if outline_buf then
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(win) == outline_buf then
              -- 动态调整窗口宽度
              local total_width = vim.o.columns
              local new_width = math.max(18, math.floor(total_width * 0.18))
              vim.api.nvim_win_set_width(win, new_width)
            end
          end
        end
      end,
    })
  end,
}
