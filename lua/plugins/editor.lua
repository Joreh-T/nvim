return {
  -- auto switch input method depends on Nvim's edit mode.
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({})
    end,
  },

  {
    "junegunn/fzf",
    build = function()
      if vim.fn.executable("fzf") == 0 then
        return "./install --bin"
      else
        return nil -- 不执行安装
      end
    end,
  },
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },

      { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      -- { "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Find Files (git-files)" },
      { "<leader>fR", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
      { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { "<leader><leader>", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Find Recent Files (cwd)" },
    },

    opts = function(_, opts)
      opts.winopts = {
        width = 0.8,
        height = 0.8,
        row = 0.5,
        col = 0.5,
        preview = {
          layout = "vertical", -- 将预览窗口布局改为垂直分布
          vertical = "down:55%", -- 预览窗口在layout中的高度位置,比例
          scrollchars = { "┃", "" },
        },
      }
    end,
  },
  {
    -- 光标动画
    "sphamba/smear-cursor.nvim",
    opts = {
      -- cursor_color = "#ff8800",
      stiffness = 0.5,
      trailing_stiffness = 0.4,
      -- trailing_exponent = 1,
      -- distance_stop_animating = 0.5,
      -- gamma = 1,
      --  -- Smear cursor when switching buffers or windows.
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines.
      smear_between_neighbor_lines = false,

      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears will blend better on all backgrounds.
      legacy_computing_symbols_support = false,
    },
  },
  {
    {
      "brenton-leighton/multiple-cursors.nvim",
      version = "*", -- Use the latest tagged version
      opts = {}, -- This causes the plugin setup function to be called
      keys = {
        -- { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
        -- { "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },

        { "<A-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
        { "<A-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

        {
          "<C-LeftMouse>",
          "<Cmd>MultipleCursorsMouseAddDelete<CR>",
          mode = { "n", "i" },
          desc = "Add or remove cursor",
        },

        {
          "<Leader>a",
          "<Cmd>MultipleCursorsAddMatches<CR>",
          mode = { "n", "x" },
          desc = "Add cursors to all the cword",
        },
        -- {
        --   "<Leader>A",
        --   "<Cmd>MultipleCursorsAddMatchesV<CR>",
        --   mode = { "n", "x" },
        --   desc = "Add cursors to cword in previous area",
        -- },

        {
          "<A-j>",
          "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
          mode = { "n", "x" },
          desc = "Add cursor and jump to next cword",
        },
        -- { "<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },

        -- { "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      local custom_opts = vim.tbl_deep_extend("force", opts, {
        messages = {
          view_search = false, -- 关闭搜索virtual text
        },
      })
      require("noice").setup(custom_opts)
    end,
  },
}
