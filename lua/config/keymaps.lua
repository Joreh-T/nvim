-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function close_terminal_and_focus_largest()
  -- 关闭当前窗口
  vim.cmd("close")
  -- Snacks.terminal(nil, { cwd = LazyVim.root() })

  -- 查找剩余窗口中面积最大的窗口
  local max_area = 0
  local target_win = nil
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local config = vim.api.nvim_win_get_config(win)
    if not config.relative or config.relative == "" then -- 忽略浮动窗口
      local width = vim.api.nvim_win_get_width(win)
      local height = vim.api.nvim_win_get_height(win)
      local area = width * height
      if area > max_area then
        max_area = area
        target_win = win
      end
    end
  end

  -- 如果找到了目标窗口，则跳转到该窗口
  if target_win then
    vim.api.nvim_set_current_win(target_win)
  end
end

-- Avoid abnormal terminal height when an outline buffer exists in the current window.
local function open_terminal_rezise_height()
  -- 保存当前窗口列表用于对比
  local prev_wins = vim.api.nvim_list_wins()

  local has_outline = false
  for _, win in ipairs(prev_wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype:match("Outline") then
      has_outline = true
      break
    end
  end

  Snacks.terminal()

  -- 异步处理窗口尺寸调整
  vim.schedule(function()
    if has_outline then
      -- 获取新创建的终端窗口
      local new_wins = vim.api.nvim_list_wins()
      local term_win = nil
      for _, win in ipairs(new_wins) do
        if not vim.tbl_contains(prev_wins, win) then
          term_win = win
          break
        end
      end

      local ui_height = vim.api.nvim_list_uis()[1].height

      if term_win then
        -- 切换到终端窗口进行操作
        vim.api.nvim_set_current_win(term_win)
        -- 计算并设置高度（至少保留 5 行高度）
        local new_height = math.max(5, math.floor(ui_height * 0.2))
        vim.api.nvim_win_set_height(term_win, new_height)
        -- 锁定窗口高度（可选）
        -- vim.wo[term_win].winfixheight = true
      end
    end
  end)
end

local map = vim.keymap.set
local del = vim.keymap.del

-----------------------------------------------------------
map("n", "<C-i>", "<C-i>", { noremap = true, silent = true })
map("n", "<C-o>", "<C-o>", { noremap = true, silent = true })
map("n", "<leader>sx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" })
map("n", "<S-u>", "<C-r>", { noremap = true, silent = true })
map("n", "<leader>r", "<cmd>LspRestart<CR>", { noremap = true, silent = false, desc = "Restart LSP" })
map("n", "<CR>", "o<esc>", { noremap = true, silent = true })
map("t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true })

--open/close terminal
-- map("n", "<a-`>", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
-- map("n", "<a-`>", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Open Terminal (Root Dir)" })
-- { map("t", "<a-`>", "<cmd>close<cr>", { desc = "Hide Terminal" }) },
--
map("n", "<a-`>", open_terminal_rezise_height, { desc = "Terminal (cwd)" })
map("t", "<a-`>", close_terminal_and_focus_largest, { desc = "Hide Terminal and Focus Largest Window" })

map("n", "<leader>ft", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<leader>fT", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })

-- buffer motion
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search In Curren Buffer" })

-- map("n", "<leader>fr", function()
--   require("telescope").extensions["recent-files"].recent_files({})
-- end, { noremap = true, silent = true, desc = "Recent Files" })
-- map("n", "<leader><leader>", function()
--   require("telescope").extensions["recent-files"].recent_files({})
-- end, { noremap = true, silent = true, desc = "Recent Files" })

del("n", "<leader>|") -- del keymap: map("<leader>|", "<C-W>v", { desc = "Split Window Right" }) },
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = false })
-----------------------------------------------------------
map({ "n", "v" }, "<S-h>", "^", { noremap = true, silent = true })
map("n", "<S-l>", "$", { noremap = true, silent = true })
map("v", "<S-l>", "$h", { noremap = true, silent = true })
-- map({ "n", "v" }, "<S-l>", "$", { noremap = true, silent = true }) --这俩放一起，v模式下会选中换行符

-----------------------------------------------------------
map("i", "jk", "<esc>", { noremap = true, silent = true })

-----------------------------------------------------------
map("v", "jkl", "<esc>", { noremap = true, silent = true })
-- diagnostic 浮动窗口显示diagnostic内容

map("n", "gh", function()
  vim.diagnostic.open_float(nil, {
    border = "rounded", -- You can choose "single", "double", "rounded", or "solid"
  })
end, { noremap = true, silent = true, desc = "Hover diagnostic" })

--   {map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })},
--   {map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })}
--   { "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },
