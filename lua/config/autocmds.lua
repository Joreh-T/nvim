-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable spelling check.
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell") 

-- Treat "*.jsp" files as HTML files.
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.jsp"},
  callback = function()
    vim.bo.filetype = "html"
  end,
})

------------------ Avante------------------
local group = vim.api.nvim_create_augroup("AvanteAutoToggle", { clear = true })

local function focus_largest_window()
  local max_area = 0
  local target_win = nil

  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local config = vim.api.nvim_win_get_config(win)
    if not config.relative or config.relative == "" then
      local width = vim.api.nvim_win_get_width(win)
      local height = vim.api.nvim_win_get_height(win)
      local area = width * height
      if area > max_area then
        max_area = area
        target_win = win
      end
    end
  end

  if target_win then
    vim.api.nvim_set_current_win(target_win)
  end
end
-- 定义需要监视的文件类型列表
local target_filetypes = {
  "snacks_terminal",
  "Outline",
  -- "neo-tree"
}

-- 检查是否存在 Avante 开头的文件类型窗口
local function has_avante_window()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype:match("^Avante") then
      return true
    end
  end
  return false
end

-- 安全防抖函数 (支持 Neovim 0.5+)
local debounce_toggle = (function()
  local cooldown = false -- 新增冷却状态标志
  local timer = nil
  return function(ft)
    -- 如果处于冷却状态则直接返回
    if cooldown then
      print("[Avante] In cooldown, skip toggle")
      return
    end

    -- 立即执行操作
    if has_avante_window() then
      vim.cmd("AvanteToggle")
      vim.cmd("AvanteToggle")
      focus_largest_window()
      vim.defer_fn(function()
        vim.cmd("stopinsert")
      end, 320)
    end

    -- 启动冷却计时器
    cooldown = true
    timer = vim.loop.new_timer()
    if not timer then
      vim.notify("Failed to create avanteCheck timer", vim.log.levels.ERROR)
      return
    end

    timer:start(
      200, -- 冷却时间 200ms
      0,
      vim.schedule_wrap(function()
        -- 安全释放资源
        pcall(function()
          timer:close()
        end)
        timer = nil
        cooldown = false -- 解除冷却状态
        -- print("[Avante] Cooldown ended")
      end)
    )
  end
end)()

-- 自动命令配置
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = group,
  callback = function(args)
    local ft = vim.bo[args.buf].filetype

    if vim.tbl_contains(target_filetypes, ft) then
      vim.schedule(function()
        debounce_toggle(ft)
      end)
    end
  end,
})
------------------ End Of Avante------------------



-- vim.api.nvim_create_autocmd("VimResized", {
--   callback = function()
--     -- 检查 NeoTree 是否已经打开
--     local neotree_is_open = vim.fn.bufexists("NvimTree_1") == 1 or vim.fn.bufexists("neo-tree filesystem [1]") == 1
--     if neotree_is_open then
--       -- 使用快捷键的方式来切换 NeoTree
--       local ok, neotree_cmd = pcall(function()
--         return require("neo-tree.command").execute
--       end)
--       if ok then
--         neotree_cmd({ toggle = true, dir = vim.uv.cwd() })
--         neotree_cmd({ toggle = true, dir = vim.uv.cwd() })
--         vim.opt.list = false
--         vim.opt.listchars = "" -- 清空 listchars 配置
--       else
--         -- 如果命令失败，可以选择使用 vim.cmd 来关闭和重新打开 NeoTree
--         vim.cmd("Neotree close")
--         vim.cmd("Neotree show")
--       end
--     end
--   end,
-- })
--
--
--
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   pattern = "*", -- 对所有窗口应用该事件
--   callback = function()
--     -- 检查是否是 NeoTree 窗口
--     if vim.bo.filetype == "neo-tree" then
--       -- 禁用不可见字符显示
--       vim.opt_local.list = false
--       vim.opt_local.listchars = "" -- 清空 listchars 配置
--     else
--       -- 恢复正常窗口的设置（如果需要的话）
--       local total_lines = vim.fn.line("$")
--       for i = 1, total_lines do
--         local line = vim.fn.getline(i)
--         -- 如果是空行，禁用不可见字符
--         if line == "" then
--           vim.opt_local.list = false
--           vim.opt_local.listchars = "" -- 清空 listchars 配置
--         else
--           vim.opt_local.list = true
--           vim.opt_local.listchars = { space = "·", tab = ">-", eol = "↲" }
--         end
--       end
--     end
--   end,
-- })
