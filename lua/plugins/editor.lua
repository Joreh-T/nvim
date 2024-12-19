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
}
