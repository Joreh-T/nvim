-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.winbar = "%=%m %f" -- %m:文件状态 "-":no modify "+":modified


-- Disable winbar in NeoTree window
vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    vim.opt.winbar = "" -- Disable winbar for NeoTree
  end,
})

vim.g.autoformat = false
vim.opt.list = true
vim.opt.tabstop = 4       -- 设置 tab 键的宽度为 4
vim.opt.shiftwidth = 4    -- 设置自动缩进时的宽度为 4
vim.opt.expandtab = true -- 保持 tab 字符不转换为空格
vim.opt.listchars = { space = "·", tab = ">-"}
vim.opt.conceallevel = 0
vim.g.python3_host_prog = '/usr/bin/python3'


-- 在打开 Makefile 时设置 expandtab = false
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt.expandtab = false  -- 在 Makefile 中禁用 expandtab
  end
})