-- 检查是否存在 Avante 开头的文件类型窗口
local M = {}

function M.has_avante_window()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype:match("^Avante") then
      return true
    end
  end
  return false
end

return M
