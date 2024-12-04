local PlaceholderHighlighter = {}

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
function PlaceholderHighlighter.highlight_nearby()
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
function PlaceholderHighlighter.setup_autocmd()
  vim.cmd([[
    augroup PlaceholderHighlight
      autocmd!
      autocmd TextChanged,TextChangedI,CursorHold * lua require("placeholder_highlighter").highlight_nearby()
    augroup END
  ]])
end

-- 初始化模块
function PlaceholderHighlighter.setup()
  PlaceholderHighlighter.setup_autocmd()
end

-- 导出模块
return PlaceholderHighlighter
