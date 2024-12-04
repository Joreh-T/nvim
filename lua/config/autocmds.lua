-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- 高亮格式化字符串中的占位符
-- function highlight_placeholders()
--   -- 获取当前行的文本
--   local line = vim.fn.getline(".")  -- 获取当前光标所在行的文本
--
--   -- 正则表达式匹配占位符，匹配 % 后面跟字母或数字（如 %s, %d, %f 等）
--   local pattern = "%%[%a%d]"
--
--   -- 查找所有匹配的位置
--   local start_pos = 0
--   while true do
--     start_pos = string.find(line, pattern, start_pos)
--     if not start_pos then break end  -- 如果没有找到匹配项，结束
--
--     -- 获取当前行号和匹配位置
--     local row = vim.fn.line(".") - 1  -- 行号，从 0 开始
--     local col = start_pos - 1         -- 列号，从 0 开始
--
--     -- 高亮显示占位符
--     vim.api.nvim_buf_add_highlight(0, -1, "Identifier", row, col, col + 2)  -- "Identifier" 是高亮组
--
--     start_pos = start_pos + 1  -- 移动到下一个位置继续查找
--   end
-- end
--
-- -- 设置一个自动命令，在插入模式退出时触发高亮
-- vim.cmd([[
--   augroup HighlightPlaceholders
--     autocmd!
--     autocmd TextChangedI * lua highlight_placeholders()
--   augroup END
-- ]])


-- 自定义占位符高亮组
vim.api.nvim_set_hl(0, "Placeholder", { fg = "#ff79c6", bold = true }) -- 你可以修改颜色和样式

-- 正则表达式匹配支持多种占位符
local placeholder_pattern = "%%[%a%d]" -- 支持 % 后面跟字母或数字的占位符

-- 获取当前光标位置的函数
local function get_cursor_position()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))  -- 获取当前窗口的光标行号（0-based）
  return row
end

-- 高亮缓冲区中的指定范围内的所有占位符
function PlaceholderHighlight_nearby()
  local bufnr = vim.api.nvim_get_current_buf() -- 获取当前缓冲区编号
  local line_count = vim.api.nvim_buf_line_count(bufnr) -- 获取缓冲区总行数
  local cursor_line = get_cursor_position() -- 获取光标行号
  
  -- 设置高亮范围（最多50行）
  local start_line = math.max(0, cursor_line - 50)  -- 最小行号是0
  local end_line = math.min(line_count - 1, cursor_line + 50) -- 最大行号是 line_count - 1
  
  -- 清除已有高亮，防止重复叠加
  vim.api.nvim_buf_clear_namespace(bufnr, -1, start_line, end_line + 1)

  -- 遍历光标附近的行进行正则匹配
  for row = start_line, end_line do
    local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1] or ""
    local start_pos = 0

    while true do
      local start, stop = string.find(line, placeholder_pattern, start_pos)
      if not start then break end

      if start and stop then
        -- 添加高亮（`stop` 是匹配结束位置）
        vim.api.nvim_buf_add_highlight(bufnr, -1, "Placeholder", row, start - 1, stop)
      end
      -- 更新起始位置，避免无限循环
      start_pos = stop + 1
    end
  end
end

-- 自动触发函数，支持光标移动和文本变化
  vim.cmd([[
    augroup PlaceholderHighlight
      autocmd!
      autocmd TextChanged,TextChangedI,CursorHold * lua PlaceholderHighlight_nearby()
    augroup END
  ]])

