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
-- 设置 Neovim 启动时使用 PowerShell
local os = vim.loop.os_uname().sysname
if os == 'Windows_NT' then
  vim.o.shell = 'powershell'
end

vim.opt.list = true -- 显示不可见字符
vim.opt.listchars = { space = "·", tab = ">-", eol = "↲"}
vim.opt.tabstop = 4 -- 设置 tab 键的宽度为 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- 设置自动缩进时的宽度为 4
vim.opt.copyindent = true
vim.opt.expandtab = true -- 插入tab 转换为空格
vim.opt.smartindent = true
-- vim.opt.autoindent = true
vim.opt.conceallevel = 0 -- 显示隐藏字符
vim.opt.clipboard = "unnamedplus" --使用系统剪切板替换nvim剪切板 
vim.opt.relativenumber = true -- 相对行号
vim.opt.number = true
vim.opt.jumpoptions = "stack"

---------------------------------------------------------------------
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.autoformat = false
vim.o.wrap = true

vim.g.snacks_animate = false -- 暂时关闭动画， 会导致V模式下向下选择时光标异常
---------------------------------------------------------------------
---
vim.o.virtualedit = "onemore" -- 设置 virtualedit, 光标上下移动不会默认到行尾
vim.o.undofile = true -- 保存文件的所有更改历史
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


if vim.g.neovide then
  vim.g.neovide_title_background_color = "#2a2f38"
  -- string.format(
  --   "%x",
  -- vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg)
  --
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
  vim.g.neovide_ligatures = true -- 启用连字效果

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_transparency = 0.99

  -- Cursor Animation
  vim.g.neovide_cursor_animation_length = 0.15 -- 光标移动动画速度
  vim.g.neovide_cursor_trail_size = 0.2 -- 拖尾长度
  vim.g.neovide_cursor_antialiasing = true -- 抗锯齿
  -- ""：禁用粒子。
  -- "railgun"：光束效果
  -- "torpedo"：拖尾粒子
  -- "pixiedust"：闪烁粒子
  -- "sonicboom"：冲击波效果
  -- "ripple"：涟漪效果
  -- "wireframe"：线框效果
  vim.g.neovide_cursor_vfx_mode = "pixiedust" -- 粒子效果模式

  -- Scroll Animatio
  vim.g.neovide_scroll_animation_length = 0.3 -- 滚动动画时长（秒）
  vim.g.neovide_scroll_animation_far = 1.5 -- 远距离滚动时放大动画

  -- Window Effects
  vim.g.neovide_floating_blur = 10 -- 浮动窗口模糊强度
  vim.g.neovide_floating_opacity = 0.8 -- 透明度
  vim.g.neovide_floating_z_height = 10 -- 悬浮高度

  vim.g.neovide_window_blurred = true
end
