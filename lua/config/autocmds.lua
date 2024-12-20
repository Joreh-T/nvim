-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    -- 检查 NeoTree 是否已经打开
    local neotree_is_open = vim.fn.bufexists("NvimTree_1") == 1 or vim.fn.bufexists("neo-tree filesystem [1]") == 1
    if neotree_is_open then
      -- 重新加载 NeoTree，确保宽度动态更新
      vim.cmd("Neotree close")
      vim.cmd("Neotree show")
    end
  end,
})

