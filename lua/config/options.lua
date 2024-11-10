-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- 在打开 Makefile 时设置 expandtab = false
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt.expandtab = false -- 在 Makefile 中禁用 expandtab
  end,
})

---------------------------------------------------------------------
---
-- 显示不可见字符
vim.opt.list = true
vim.opt.tabstop = 4 -- 设置 tab 键的宽度为 4
vim.opt.shiftwidth = 4 -- 设置自动缩进时的宽度为 4
vim.opt.expandtab = true -- 保持 tab 字符不转换为空格
vim.opt.listchars = { space = "·", tab = ">~" }

vim.opt.conceallevel = 0 -- 显示隐藏字符
vim.opt.clipboard = "unnamedplus"

---------------------------------------------------------------------
---
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.autoformat = false

---------------------------------------------------------------------
---
vim.o.virtualedit = "onemore" -- 设置 virtualedit, 光标上下移动不会默认到行尾
vim.o.undofile = false -- 关闭保存文件的所有更改历史, 避免undo一下回到第一次打开的时候
vim.o.scrolloff = 7 -- 保证上下各有 n 行显示空间

--
-- if vim.fn.has("wsl") == 1 then
--     vim.g.clipboard = {
--         name = "winclp",
--         copy = {
--             ["+"] = "clip.exe",
--             ["*"] = "clip.exe"
--         },
--         paste = {
--             ["+"] = "powershell.exe -command 'Get-Clipboard'",
--             ["*"] = "powershell.exe -command 'Get-Clipboard'"
--         },
--         cache_enabled = false,
--     }
-- end
-- wsl 跨系统复制粘贴
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = false,
  }
end
