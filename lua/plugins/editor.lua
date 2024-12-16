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
}
